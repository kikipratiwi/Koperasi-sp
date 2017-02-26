class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.column :amount, :integer, null: false
      t.column :accorded_at, :datetime, null: true
      t.column :paid_off_at, :date,  	null: true
      t.column :status,      :integer, null: false, default: 0
      t.column :info,        :string,  null: true

      t.timestamps null: false
    end
  end
end
