class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.string "is_member"
      t.integer "user_id"
      t.string "membership_paid"
      t.timestamps
    end
  end
end
