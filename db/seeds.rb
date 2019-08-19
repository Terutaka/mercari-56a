# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

require 'faker'

10.times do |n|
  name = Faker::Name.name
  description = "test_description"
  condition = "非常に良い"
  shipping_method = "ゆうパック"
  shipping_charge = "送料込み"
  ship_from_region = "愛知県"
  shipping_date = "4〜7日以内に発送"
  price = Faker::Number.number(4)

  Item.create!(
    name: name,
    description: description,
    condition: condition,
    shipping_method: shipping_method,
    shipping_charge: shipping_charge,
    ship_from_region: ship_from_region,
    shipping_date: shipping_date,
    price: price
    )
end