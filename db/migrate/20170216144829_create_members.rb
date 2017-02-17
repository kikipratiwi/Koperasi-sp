class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.column :name,         :string,  null: false
      t.column :address,      :text,    null: false
      t.column :birthplace,   :string,  null: false
      t.column :birthdate,    :date,    null: false
      t.column :phone_number, :string,  null: false
      t.column :status,       :integer, null: false, default: 0
      t.column :gender,       :integer, null: false, default: 0
      t.column :info,         :string

      t.timestamps null: false
    end
  end
end
