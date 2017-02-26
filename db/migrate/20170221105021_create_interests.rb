class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.column :type_name, :string, null: false
      t.column :rate, :integer, null: false, default: 1

      t.timestamps null: false
    end
  end
end
