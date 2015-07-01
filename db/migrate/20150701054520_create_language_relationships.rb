class CreateLanguageRelationships < ActiveRecord::Migration
  def change
    create_table :language_relationships do |t|
      t.integer :user_id
      t.integer :language_id
      t.string :relationship

      t.timestamps
    end
  end
end
