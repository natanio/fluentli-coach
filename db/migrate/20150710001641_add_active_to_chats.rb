class AddActiveToChats < ActiveRecord::Migration
  def change
    add_column :chats, :active, :boolean, default: true
  end
end
