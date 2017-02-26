class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.column :total, :integer, null: false
      t.column :due_date, :string, null: true

      t.timestamps null: false
    end
  end
end
