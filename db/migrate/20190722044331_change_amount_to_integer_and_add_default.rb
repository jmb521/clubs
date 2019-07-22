class ChangeAmountToIntegerAndAddDefault < ActiveRecord::Migration[5.2]
  def change
    remove_column :payments, :amount
    add_column :payments, :amount, :integer, :default => 34

  end
end
