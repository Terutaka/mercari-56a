class AddAncestryToFeeSide < ActiveRecord::Migration[5.2]
  def change
    add_column :fee_sides, :ancestry, :string
    add_index :fee_sides, :ancestry
  end
end
