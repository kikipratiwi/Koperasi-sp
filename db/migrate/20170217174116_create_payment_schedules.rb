class CreatePaymentSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_schedules do |t|
      t.column :amount, :integer, null: false
      t.column :interest, :integer, null: false
      t.column :sequence, :string, null: false
      t.column :info, :string

      t.timestamps null: false
    end
  end
end
