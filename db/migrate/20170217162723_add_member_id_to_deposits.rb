class AddMemberIdToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :member_id, :integer, after: :id, null: false
    add_index :deposits, :member_id
  end
end
