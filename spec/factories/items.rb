FactoryBot.define do
  factory :item do
    name             { '商品のなまえだよ' }
    explain          { '商品の説明だよ' }
    category_id      { '1' }
    state_id         { '1' }
    fee_side_id      { '10' }
    shipping_date_id { '1' }
    brand_id         { '1' }
    price            { '300' }
    prefecture_id    { '1' }
    saler_id         { '1' }
    buyer_id         { '1' }
    likes_count      { '1' }
  end
end