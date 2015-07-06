class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :learner_id
      t.integer :coach_id
      t.text :content

      t.timestamps
    end
  end
end
