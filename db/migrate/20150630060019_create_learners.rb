class CreateLearners < ActiveRecord::Migration
  def change
    create_table :learners do |t|
      t.text :bio
      t.text :reason_why
      t.integer :user_id
    end
  end
end
