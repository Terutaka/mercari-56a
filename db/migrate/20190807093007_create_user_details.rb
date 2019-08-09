class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.references  :user, foreign_key: true
      t.string      :postal_code, null: false
      t.string      :city,  null: false
      t.string      :address,  null: false
      t.string      :building
      t.string      :phone_number

      t.timestamps
    end
  end
end
