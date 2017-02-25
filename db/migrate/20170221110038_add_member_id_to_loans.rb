class AddMemberIdToLoans < ActiveRecord::Migration[5.0]
  def change
    add_column :loans, :member_id, :integer, after: :id, null: false
    add_index :loans, :member_id
  end
end
