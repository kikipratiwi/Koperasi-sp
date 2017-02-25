class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.column :amount, 	 :decimal, precision: 8, scale: 2,  null: false
      t.column :accorded_at, :datetime, null: false
      t.column :loan_at, 	 :datetime, null: false
      t.column :paid_off_at, :date,  	null: false
      t.column :info,   	 :integer, 	null: false, default: 0

      t.timestamps null: false
    end
  end
end
