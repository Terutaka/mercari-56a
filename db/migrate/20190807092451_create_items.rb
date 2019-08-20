class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string          :name,  null: false
      t.string          :explain,  null: false
      t.integer         :category_id,  foreign_key: true, null: false
      t.string          :state_id,  null: false
      t.integer         :fee_side_id,  null: false
      t.integer         :shipping_date_id,  null: false
      t.integer         :brand_id, null: false
      t.integer         :price,  null: false
      t.integer         :prefecture_id, foreign_key: true, null: false
      t.integer         :saler_id, foreign_key: true
      t.integer         :buyer_id,  foreign_key: true
      t.integer         :likes_count

      t.timestamps  null: true
    end
  end
end
