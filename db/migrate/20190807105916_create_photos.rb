class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string  :img_list,  null: false

      t.timestamps
    end
  end
end
