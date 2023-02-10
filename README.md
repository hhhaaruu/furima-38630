#テーブル設計

##usersテーブル

| Column                | Type    | Option                              |
| --------------------- | ------- | ----------------------------------- |
| nickname              | string  | null: false                         |
| email                 | string  | null: false, uniqueness: true       |
| password              | string  | null: false                         |
| password-confirmation | string  | null: false                         |
| last-name             | string  | null: false                         |
| first-name            | string  | null: false                         |
| last-name-kana        | string  | null: false                         |
| first-name-kana       | string  | null: false                         |
| birth-date            | integer | null: false                         |

###アソシエーション
- has_many :items
- has_many :addresses
- has_many :buys
##itemsテーブル

| Column                     | Type       | Option                                  |
| -------------------------- | ---------- | --------------------------------------- |
| item-image                 | string     | null: false                             |
| item-name                  | text       | null: false                             |
| item-info                  | text       | null: false                             |
| category-id                | integer    | null: false                             |
| sales-status-id            | integer    | null: false                             |
| shipping-fee-status-id     | integer    | null: false                             |
| prefecture-id              | integer    | null: false                             |
| scheduled-delivery-id      | integer    | null: false                             |
| item-price                 | integer    | null: false                             |
| user_id                    | references | null: false, foreign_key: true          |

###アソシエーション
- belongs_to :user
- has_one :address
- belongs_to :category
- belongs_to :sales-status
- belongs_to :shipping-fee-status
- belongs_to :prefecture
- belongs_to :schedule-delivery 
- has_one :buy

##addressesテーブル

| Column             | Type       | Option                                  |
| ------------------ | ---------- | --------------------------------------- |
| postal-code        | text       | null: false                             |
| prefecture         | integer    | null: false                             |
| city               | text       | null: false                             |
| addresses          | text       |
| building           | text       |
| phone-number       | text       |
| item_id            | references | null: false, foreign_key: true  
| user_id            | references | null: false, foreign_key: true

###アソシエーション
- belongs_to :user
- belongs_to :item
- belongs_to :prefecture

##buysテーブル
| Colum             | Type       | Option                                   |
| ----------------- | ---------- | ---------------------------------------- |
| user_id           | references | null: false, foreign_key: true           |
| item_id           | references | null: false, foreign_key: true           |

###アソシエーション
- belongs_to :user
- belongs_to :item
