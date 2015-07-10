class AddCustomerIdToLearners < ActiveRecord::Migration
  def change
    add_column :learners, :stripe_customer_id, :string
  end
end
