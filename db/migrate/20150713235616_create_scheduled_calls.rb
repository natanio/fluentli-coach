class CreateScheduledCalls < ActiveRecord::Migration
  def change
    create_table :scheduled_calls do |t|
      t.text :call_details
      t.integer :price
      t.integer :coach_id
      t.integer :learner_id

      t.timestamps
    end
    add_index :scheduled_calls, :coach_id
    add_index :scheduled_calls, :learner_id
  end
end
