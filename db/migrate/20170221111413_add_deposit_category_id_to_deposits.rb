class AddDepositCategoryIdToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :deposit_category_id, :integer, after: :id, null: false
    add_index :deposits, :deposit_category_id            
  end
end
