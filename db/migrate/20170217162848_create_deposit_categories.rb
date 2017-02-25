class CreateDepositCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :deposit_categories do |t|
      t.column :name, :integer, null: false, default: 0

      t.timestamps null: false
    end
  end
end
