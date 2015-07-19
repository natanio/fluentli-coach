class CreateSuggestedTimes < ActiveRecord::Migration
  def change
    create_table :suggested_times do |t|
      t.datetime :time
      t.boolean :agreed
      t.integer :scheduled_call_id

      t.timestamps
    end
  end
end
