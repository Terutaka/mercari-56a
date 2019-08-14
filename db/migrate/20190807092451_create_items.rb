class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer         :photo_id,  foreign_key: true, null: false
      t.string          :name,  null: false
      t.string          :explain,  null: false
      t.integer         :category_id,  foreign_key: true, null: false
      t.string          :size, null: false
      t.string          :state,  null: false
      t.integer         :brand_id, foreign_key: true, null: false
      t.integer         :fee_side,  null: false
      t.integer         :shipping_date,  null: false
      t.integer         :price,  null: false
      t.integer         :prefecture_id, foreign_key: true, null: false
      t.integer         :saler_id, foreign_key: true, null: false
      t.integer         :buyer_id,  foreign_key: true ,null: false
      t.integer         :likes_count

      t.timestamps  null: true
    end
  end
end
