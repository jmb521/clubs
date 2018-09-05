class CreateFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.integer "user_id"
      t.datetime "user_birthday"
      t.string "spouse"
      t.datetime "spouse_birthday"
      
      t.timestamps
    end
  end
end
