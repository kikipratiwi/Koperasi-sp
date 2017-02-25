class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.column :total, :decimal, precision: 8, scale: 2,  null: false
      t.column :due_date, :string, null: false

      t.timestamps null: false
    end
  end
end
