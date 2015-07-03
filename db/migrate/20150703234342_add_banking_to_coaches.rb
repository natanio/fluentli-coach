class AddBankingToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :bank_account_name, :string
    add_column :coaches, :bank_account_number, :integer
    add_column :coaches, :bank_routing, :integer
    add_column :coaches, :paypal_email, :string
  end
end
