#テーブル設計

##usersテーブル

| Column                | Type    | Option                              |
| --------------------- | ------- | ----------------------------------- |
| nickname              | string  | null: false                         |
| email                 | string  | null: false, unique: true           |
| encrypted_password    | string  | null: false                         |
| last_name             | string  | null: false                         |
| first_name            | string  | null: false                         |
| last_name_kana        | string  | null: false                         |
| first_name_kana       | string  | null: false                         |
| birth_date            | date    | null: false                         |

###アソシエーション
- has_many :items
- has_many :buys

##itemsテーブル

| Column                     | Type       | Option                                  |
| -------------------------- | ---------- | --------------------------------------- |
| item_name                  | string     | null: false                             |
| item_info                  | text       | null: false                             |
| category_id                | integer    | null: false                             |
| sales_status_id            | integer    | null: false                             |
| shipping_fee_status_id     | integer    | null: false                             |
| prefecture_id              | integer    | null: false                             |
| scheduled_delivery_id      | integer    | null: false                             |
| item_price                 | integer    | null: false                             |
| user                       | references | null: false, foreign_key: true          |

###アソシエーション
- belongs_to :user
- belongs_to :category
- belongs_to :sales-status
- belongs_to :shipping-fee-status
- belongs_to :prefecture
- belongs_to :schedule-delivery 
- has_one :buy

##addressesテーブル

| Column             | Type       | Option                                  |
| ------------------ | ---------- | --------------------------------------- |
| postal_code        | string     | null: false                             |
| prefecture_id      | integer    | null: false                             |
| city               | string     | null: false                             |
| addresses          | string     | null: false                             |
| building           | string     |                                         |
| phone_number       | string     | null: false                             |

###アソシエーション
- belongs_to :prefecture
- has_one :buy

##buysテーブル
| Colum             | Type       | Option                                   |
| ----------------- | ---------- | ---------------------------------------- |
| user              | references | null: false, foreign_key: true           |
| item              | references | null: false, foreign_key: true           |
| address           | references | null: false, foreign_key: true           |

###アソシエーション
- belongs_to :user
- belongs_to :item
- belongs_to :address
