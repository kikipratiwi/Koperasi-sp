class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.column :type, :string, null: false
      t.column :rate, :decimal, precision: 2, scale: 2,  null: false

      t.timestamps null: false
    end
  end
end
