class CreateChildren < ActiveRecord::Migration[5.2]
  def change
    create_table :children do |t|
      t.integer "user_id"
      t.string "name"
      t.string "birthday"
      t.timestamps
    end
  end
end
