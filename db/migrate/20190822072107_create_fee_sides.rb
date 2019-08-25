class CreateFeeSides < ActiveRecord::Migration[5.2]
  def change
    create_table :fee_sides do |t|
      t.string :name

      t.timestamps
    end
  end
end
