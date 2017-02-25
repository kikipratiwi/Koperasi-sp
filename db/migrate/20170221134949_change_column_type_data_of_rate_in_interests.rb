class ChangeColumnTypeDataOfRateInInterests < ActiveRecord::Migration[5.0]
  def up
    change_column :interests, :rate, :integer, null: false, default: 1
  end

  def down
    change_column :interests, :rate, :decimal, precision: 2, scale: 2,  null: false
  end
end
