class CreateLoanTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_types do |t|
      t.column :name, :integer, null: false, default: 0
      t.column :term, :integer, null: false, default: 0

      t.timestamps null: false
    end
  end
end
