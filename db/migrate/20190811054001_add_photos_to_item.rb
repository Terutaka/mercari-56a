class AddPhotosToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :item_id, :integer
  end
end
