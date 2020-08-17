# README

## usesテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
|nickname       | string  | null: false |
|email          | string  | null: false |
|password       | string  | null: false |
|first_name     | string  | null: false |
|last_name      | string  | null: false |
|year_birthday  | integer | null: false |
|month_birthday | integer | null: false |
|day_birthday   | integer | null: false |

### Association

- has_many :orders
- has_many :items
- has_many :comments

## ordersテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| credit_card_number | integer | null: false |
| expiration_date    | integer | null: false |
| csv                | integer | null: false |
| post_number        | integer | null: false |
| prefecture         | string  | null: false |
| city               | string  | null: false |
| address            | strind  | null: false |
| phone_number       | string  | null: false |

### Association

- belongs_to :users
- has_many :comments
- belongs_to :items

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| image              | text       | null: false                    |
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| category           | string     | null: false                    |
| state              | string     | null: false                    |
| delivery_fee       | boolean    | null: false                    |
| ship_from_location | string     | null: false                    | 
| delivery_date      | integer    | null: false                    | 
| price              | integer    | null: false                    |
| existense          | boolean    |                                |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :oredrs

## commentsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| comments_text  | text       |                                |
| comments_image | text       |                                |
| order          | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders