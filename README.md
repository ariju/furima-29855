## テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------             | ---------- | ------------|
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_name_kana     | string     | null: false |
| first_name_kana    | string     | null: false |
| birthday           | date       | null: false |

### Association
- has_many :items
- has_many :purchase

## itemsテーブル

| Column                        | Type       | Options                        |
| ------                        | ---------- | ------------------------------ |
| user_name                     | string     | null: false                    |
| product_name                  | string     | null: false                    |
| product_ name_description     | text       | null: false                    |
| category_id                   | integer    | null: false, foreign_key: true |
| product_condition_id          | integer    | null: false, foreign_key: true |
| burden_of_shipping_charges_id | integer    | null: false, foreign_key: true |
| shipping_area_id              | integer    | null: false, foreign_key: true |
| days_to_ship_id               | integer    | null: false, foreign_key: true |
| price                         | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :purchase


## purchaseテーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| user_id           | string     | null: false, foreign_key: true |
| item_id           | string     | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :items
- has_one :address

## addressテーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| prefectures_id        | integer    | null: false                    |
| municipality          | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchasing management | string     | null: false                    |


### Association
- belongs_to :purchase

