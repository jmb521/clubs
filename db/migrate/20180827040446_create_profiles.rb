class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "address1"
      t.string "address2"
      t.string "city"
      t.string "state"
      t.integer "zipcode"
      t.string "phone"
      t.integer "user_id"
      t.timestamps
    end
  end
end
