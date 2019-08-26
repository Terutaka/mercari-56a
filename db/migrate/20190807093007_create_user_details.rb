class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.references  :user, foreign_key: true
      t.string      :postal_code
      t.string      :city
      t.string      :address
      t.string      :building
      t.string      :phone_number
      t.integer     :prefecture_id
      t.string      :city


      t.timestamps
    end
  end
end
