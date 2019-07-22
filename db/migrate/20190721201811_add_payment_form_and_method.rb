class AddPaymentFormAndMethod < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :form_of_payment, :string
    add_column :payments, :how_they_paid, :string
  end
end
