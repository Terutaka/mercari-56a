# DB設計

## Items テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| photo_id | integer | foreign_key: true, null false | 画像テーブルID |
| name | string | null false, index | 商品名 |
| explain | string | null false | 商品説明 |
| category_id | integer | foreign_key: true, null false | カテゴリテーブルID |
| size | string | null false | 商品のサイズ |
| state | string | null false | 商品状態 |
| brand_id | integer | foreign_key: true | ブランドID |
| fee_side | integer | null false | 送料負担者 |
| prefecture_id |integer | foreign_key: true, null false | 発送元場所ID |
| shipping_date | integer | null false | 発送までの日数 |
| price | integer | null false | 商品価格 |
| seller_id |integer | foreign_key: true, null false | 出品者テーブルID |
| buyer_id |integer | foreign_key: true | 購入者テーブルID |
| likes_count | integer || いいね数 |

### Association

- has_many   :photos
- belongs_to :category
- belongs_to :brand
- belongs_to :prefecture
- belongs_to :user
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"

---

## Photos テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| img_list | string | null false | 画像 |

### Association

- belongs_to :item

---

## Categories テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| name | string | null false | カテゴリー名前 |
| ancestry | string |  | 子孫関係 |

### Association

- has_many :items

---

## Brands テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| name | string | null false, index | ブランド名 |

### Association

- has_many :items

---

## Prefecture テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| name | string | null false | 商品の都道府県 |

### Association

- has_many :items

---

## Users テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| user_detail_id | integer | foreign_key: true, null false | ユーザー詳細情報のid |
| nickname | string | null false, index | ニックネーム |
| email | string | null false | eメール |
| password | string | null false | パスワード |
| last_name | string | null false | 姓　漢字名前 |
| first_name | string | null false | 名　漢字名前 |
| last_name_kana | string | null false | 姓　カタカナ名前 |
| first_name_kana | string | null false | 名　カタカナ名前 |
| birthday | integer | null false | 誕生日 |
| profile | text |  | プロフィール |

### Association

- has_one :user_detail
- has_many :items
- has_one :card

---

## user_details テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| user_id | integer | foreign_key: true, null false | ユーザーのid|
| prefcture_id | integer | foreign_key: true, null false | 都道府県のid |
| postal_code | string | null false | 郵便番号 |
| city | string | null false | 市区町村 |
| address | string | null false | 番地 |
| building | string |  | 建物名 |
| phone_number | string |  | 電話 |

### Association

- belongs_to :user
- belongs_to_active_hash :prefecture

---

## cards テーブル

| Column | Type | Options | Desc |
| :-- | :-- | :-- | :-- |
| user_id | integer | foreign_key: true, null false | ユーザーテーブルのid |
| customer_id | string | null: false | payjpの顧客id |
| card_id | string | null: false | payjoのデフォルトカードid |

### Association

- belongs_to :user
