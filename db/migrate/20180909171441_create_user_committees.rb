class CreateUserCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :user_committees do |t|
      t.integer :committee_id
      t.integer :user_id
      t.timestamps
    end
  end
end
