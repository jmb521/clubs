class Changedatatypeforbirthday < ActiveRecord::Migration[5.2]
  def change
    change_column :children, :birthday, :date
  end
end
