class Addfamiliestoprofile < ActiveRecord::Migration[5.2]
  def change
    drop_table :families
    add_column :profiles, :birthday, :date
    add_column :profiles, :spouse, :string
    add_column :profiles, :spouse_birthday, :date
  end

end
