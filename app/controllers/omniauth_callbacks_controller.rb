class OmniauthCallbacksController < ApplicationController

  def stripe_connect
    @user = current_user
    if @user.coach.update_attributes({
      provider: request.env["omniauth.auth"].provider,
      uid: request.env["omniauth.auth"].uid,
      access_code: request.env["omniauth.auth"].credentials.token,
      publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
    })
      # anything else you need to do in response..
      #sign_in_and_redirect @user, :event => :authentication
      #set_flash_message(:notice, :success, :kind => "Stripe") if is_navigational_format?

      # Create a weekly subscription
      Stripe.api_key = "#{@user.coach.access_code}"

      Stripe::Plan.create(
        :amount => 1000,
        :interval => 'week',
        :name => 'Weekly Subscription to Coach',
        :currency => 'usd',
        :id => 'weekly_subscription'
      )
      redirect_to edit_user_registration_path, notice: "Great! You can now receive payment transfers from us."
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    render json: @user = current_user
  end
end