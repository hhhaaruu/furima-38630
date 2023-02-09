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

##itemsテーブル

| Column                     | Type       | Option                                  |
| -------------------------- | ---------- | --------------------------------------- |
| item-image                 | string     | null: false                             |
| item-name                  | text       | null: false                             |
| item-info                  | text       | null: false                             |
| item-category              |  | null: false          |
| item-sales-status          |  | null: false          |
| item-shipping-fee-status   |  | null: false          |
| item-prefecture            |  | null: false          |
| item-scheduled-delivery    |  | null: false          |
| item-price                 | integer    | null: false                             |
| user_id                    | references | null: false, foreign_key: true          |

###アソシエーション
- belongs_to :user
- has_one: address

##addressesテーブル

| Column             | Type       | Option                                  |
| ------------------ | ---------- | --------------------------------------- |
| postal-code        | text       | null: false                             |
| prefecture         |            | null: false, foreign_key :true          |
| city               | text       | null: false, foreign_key :true          |
| addresses          | text       |
| building           | text       |
| phone-number       | text       |
| item_id            | references | null: false, foreign_key: true  
| user_id            | references | null: false, foreign_key: true

###アソシエーション
- belongs_to :user
- belongs_to :item
