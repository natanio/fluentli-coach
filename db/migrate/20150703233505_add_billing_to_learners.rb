class AddBillingToLearners < ActiveRecord::Migration
  def change
    add_column :learners, :card_name, :string
    add_column :learners, :card_number, :integer
    add_column :learners, :card_verification, :integer
    add_column :learners, :card_expiration, :date
    add_column :learners, :billing_country, :string
    add_column :learners, :billing_street, :string
    add_column :learners, :billing_city, :string
    add_column :learners, :billing_state, :string
    add_column :learners, :billing_zip, :integer
  end
end
