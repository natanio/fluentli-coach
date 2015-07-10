class AddPublishableKeyToCoaches < ActiveRecord::Migration
  def change
    add_column :coaches, :publishable_key, :string
    add_column :coaches, :provider, :string
    add_column :coaches, :uid, :string
    add_column :coaches, :access_code, :string
  end
end
