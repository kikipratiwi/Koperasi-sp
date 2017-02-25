class AddLoanTypeIdToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :loan_type_id, :integer, after: :id, null: false
    add_index :loans, :loan_type_id
  end
end
