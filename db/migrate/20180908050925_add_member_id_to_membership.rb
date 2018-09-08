class AddMemberIdToMembership < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :member_id, :integer
  end
end
