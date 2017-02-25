class AddPaymentIdToPaymentSchedules < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_schedules, :payment_id, :integer, after: :id, null: false
    add_index :payment_schedules, :payment_id        
  end
end
