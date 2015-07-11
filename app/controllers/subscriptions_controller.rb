class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @coach = Coach.find(params[:subscriptions][:coach_id])
    Stripe.api_key = "#{@coach.access_code}"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a Customer
    customer = Stripe::Customer.create(
      :source => token,
      :email => current_user.email
    )

    customer.subscriptions.create(
      :plan => 'weekly_subscription',
      :application_fee_percent => 10
    )

    if !customer.default_source.nil?
      flash[:notice] = "Thanks for your subscription! Your payment was successful."
      current_user.learner.update_attribute(:stripe_customer_id, customer.id)
      current_user.learner.save
      redirect_to user_path(@coach.user.id)
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to user_path(@coach.user.id)
  end

  def cancel
    Stripe.api_key = ENV["STRIPE_API_KEY"]

    flash[:notice] = "Your subscription has been canceled. Hope you got the help you were needing!"
    @customer = Stripe::Customer.retrieve(current_user.customer_id)
    @customer.subscriptions.first.delete()
    current_user.save
    redirect_to root_path
  end
end