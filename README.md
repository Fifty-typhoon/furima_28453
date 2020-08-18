# README

## usesテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| kana_first_name | string | null: false |
| kana_last_name  | string | null: false |
| birthday        | date   | null: false | 

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## ordersテーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| post_number          | string  | null: false |
| prefecture           | integer | null: false |
| city                 | string  | null: false |
| address              | strind  | null: false |
| billing_address_line | string  |             |
| phone_number         | string  | null: false |

### Association

- has_many :comments
- belongs_to :item
- belongs_to :purchase

## itemsテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| image                 | string     | null: false                    |
| name                  | string     | null: false                    |
| detail                | text       | null: false                    |
| category              | integer    | null: false                    |
| state                 | integer    | null: false                    |
| delivery_fee          | integer    | null: false                    |
| ship_from_location    | integer    | null: false                    | 
| delivery_date         | integer    | null: false                    | 
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :oredr
- has_one :purchase

## purchasesテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| user   | integer | null: false |
| item   | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :comment

## commentsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| comments_text  | text       |                                |
| comments_image | text       |                                |
| order          | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase