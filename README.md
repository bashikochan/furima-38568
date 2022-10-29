# テーブル設計

## users テーブル ユーザー情報

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth              | date   | null: false              |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル 商品情報

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| item_name    | string     | null: false                   |
| description  | text       | null: false                   |
| categories   | int        | null: false                   |
| condition    | int        | null: false                   |
| shipping_fee | int        | null: false                   |
| prefecture      | int        | null: false                   |
| shipping_date| int        | null: false                   |
| price        | int        | null: false                   |
| user         | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル 購入記録

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| item_name    | string     | null: false                   |
| user         | references | null: false, foreign_key: true|
| orders_info  | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :orders_info
- has_one :item


## orders_info テーブル 発送先情報

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postcode     | string     | null: false                   |
| prefecture   | int        | null: false                   |
| city         | string     | null: false                   |
| block        | string     | null: false                   |
| building     | string     |                               |
| phone        | int        | null: false                   |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|
| order        | references | null: false, foreign_key: true|


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item