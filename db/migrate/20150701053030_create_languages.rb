class CreateLanguages < ActiveRecord::Migration
  def change
    create_table "languages", force: true do |t|
      t.string   "iso_639_1_code"
      t.string   "iso_639_2b_code"
      t.string   "iso_639_3_code"
      t.string   "native"
      t.string   "english"
      t.string   "french"
      t.string   "spanish"
      t.string   "chinese"
      t.string   "russian"
      t.string   "german"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
