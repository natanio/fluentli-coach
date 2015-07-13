module LearnersHelper
  def is_subscribed?(coach)
    find_customer(coach)
    @customer.subscriptions.data.empty?
  end

  def find_customer(coach)
    Stripe.api_key = coach.access_code
    customers = Stripe::Customer.all
    if customers.count == 0
      nil
    else
      customers.each_with_index do |customer,index|
        if customer.email == current_user.email
          return @customer = customer
        end
      end
    end
  end
end
