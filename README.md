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
- has_many :orders

## items テーブル 商品情報

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| item_name       | string     | null: false                   |
| description     | text       | null: false                   |
| categories_id   | integer    | null: false                   |
| condition_id    | integer    | null: false                   |
| shipping_fee_id | integer    | null: false                   |
| prefectures_id  | integer    | null: false                   |
| shipping_date_id| integer    | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order
- belongs_to_active_hash :categories
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipping_date

## orders テーブル 購入記録

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :orders_info


## orders_infos テーブル 発送先情報

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| postcode        | string     | null: false                   |
| prefectures_id  | integer    | null: false                   |
| city            | string     | null: false                   |
| block           | string     | null: false                   |
| building        | string     |                               |
| phone           | string     | null: false                   |
| order           | references | null: false, foreign_key: true|


### Association

 - has_one_active_hash :prefectures
 - belongs_to :order