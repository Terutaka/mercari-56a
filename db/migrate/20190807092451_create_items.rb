class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer         :photo_id,  foreign_key: true
      t.string          :name,  null: false
      t.string          :explain,  null: false
      t.integer         :category_id,  foreign_key: true, optional: true
      t.string          :size
      t.string          :state,  null: false
      t.integer         :brand_id, foreign_key: true, optional: true
      t.integer         :fee_side,  null: false
      t.integer         :shipping_date,  null: false, optional: true
      t.integer         :price,  null: false
      t.integer         :prefecture_id, foreign_key: true, null: false
      t.integer         :seller_id, foreign_key: true, optional: true
      t.integer         :buyer_id,  foreign_key: true, optional: true
      t.integer         :likes_count

      t.timestamps  null: true
    end
  end
end
