class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean "is_member", default: false
      t.integer "user_id"
      t.boolean "membership_paid", default: false

      t.timestamps
    end
  end
end
