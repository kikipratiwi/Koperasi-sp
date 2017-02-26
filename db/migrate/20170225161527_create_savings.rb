class CreateSavings < ActiveRecord::Migration[5.0]
  def change
    create_table :savings do |t|
      t.column :saving,  :string, null: false
      t.column :amount, :integer, null: false

      t.timestamps null: false
    end
  end
end
