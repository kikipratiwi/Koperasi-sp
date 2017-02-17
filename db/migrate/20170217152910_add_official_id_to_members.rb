class AddOfficialIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :official_id, :integer, after: :id, null: false
    add_index :members, :official_id
  end
end
