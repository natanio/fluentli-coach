class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    if current_user.learner.stripe_customer_id.nil?
      save_the_customer
    else
      retrieve_customer
    end

    @coach = Coach.find(params[:subscriptions][:coach_id])
    Stripe.api_key = "#{@coach.access_code}"

    # Create a Token from the existing customer on the platform's account
    token = Stripe::Token.create(
      {:customer => @customer.id },
      {:stripe_account => @coach.uid } # id of the connected account
    )

    # Create a Customer
    customer = Stripe::Customer.create(
      :source => token.id,
      :email => current_user.email
    )

    customer.subscriptions.create(
      :plan => 'weekly_subscription',
      :application_fee_percent => 10
    )

    if !customer.default_source.nil?
      flash[:notice] = "Thanks for your subscription! Your payment was successful."
      redirect_to user_path(@coach.user.id)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to user_path(@coach.user.id)
  end

  def cancel
    find_customer

    @customer.subscriptions.first.delete
    current_user.save

    flash[:alert] = "Your subscription has been canceled. Hope you got the help you were needing!"
    redirect_to user_path(current_user)
  end

  def find_customer
    user = User.find(params[:user_id])
    coach = user.coach
    Stripe.api_key = coach.access_code
    customers = Stripe::Customer.all

    customers.each_with_index do |customer,index|
      if customer.email == current_user.email
        return @customer = customers.data[index]
      end
    end
  end

  def save_the_customer
    Stripe.api_key = ENV["STRIPE_API_KEY"]

    # Get the credit card details submitted by the form
    token_id = params[:stripeToken]

    # Create a Customer
    @customer = Stripe::Customer.create(
      :source => token_id,
      :description => "#{current_user.first_name} #{current_user.last_name}'s account."
    )

    current_user.learner.update_attribute(:stripe_customer_id, @customer.id)
    current_user.learner.save
  end

  def retrieve_customer
    Stripe.api_key = ENV["STRIPE_API_KEY"]
    @customer = Stripe::Customer.retrieve(current_user.learner.stripe_customer_id)
  end
end