class AddLoanIdToPayments < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :loan_id, :integer, after: :id, null: false
    add_index :payments, :loan_id
  end
end
