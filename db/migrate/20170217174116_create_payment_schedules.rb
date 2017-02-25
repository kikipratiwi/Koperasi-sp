class CreatePaymentSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_schedules do |t|
      t.column :amount, :decimal, precision: 8, scale: 2,  null: false
      t.column :sequence, :string, null: false
      t.column :info, :string

      t.timestamps null: false
    end
  end
end
