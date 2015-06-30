class CreateCoaches < ActiveRecord::Migration
  def change
    create_table :coaches do |t|
      t.boolean :will_chat, default: false
      t.boolean :will_call, default: false
      t.boolean :is_available, default: true
      t.text :services
      t.integer :user_id
      t.string :video_url
      t.integer :call_rate
    end
  end
end
