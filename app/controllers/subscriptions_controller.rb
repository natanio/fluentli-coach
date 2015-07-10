class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    Stripe.api_key = ENV["STRIPE_API_KEY"]

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    plan = 'weekly_coach_subscription'


    customer = Stripe::Customer.create(
      :source => token,
      :plan => plan,
      :email => current_user.email
    )

    if !customer.default_card.nil?
      flash[:notice] = "Thanks and welcome! Your payment was successful."
      current_user.update_attribute(:stripe_customer_id, customer.id)
      current_user.save
      redirect_to root_path
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
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