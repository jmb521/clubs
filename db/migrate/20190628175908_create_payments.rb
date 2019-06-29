class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :membership_id
      t.string :amount 
      t.timestamps
    end
  end
end
