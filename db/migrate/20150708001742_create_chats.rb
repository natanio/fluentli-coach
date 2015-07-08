class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :learner_id
      t.integer :coach_id

      t.timestamps
    end
  end
end
