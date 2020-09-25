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
- has_many :purchases
<!-- has_manyの場合は複数形 -->

## itemsテーブル

| Column                        | Type       | Options                        |
| ------                        | ---------- | ------------------------------ |
| nickname                      | string     | null: false                    |
| product_name                  | string     | null: false                    |
| product_ name_description     | text       | null: false                    |
| category_id                   | integer    | null: false                    |
| product_condition_id          | integer    | null: false                    |
| burden_of_shipping_charges_id | integer    | null: false                    |
| shipping_area_id              | integer    | null: false                    |
| days_to_ship_id               | integer    | null: false                    |
| price                         | integer    | null: false                    |


### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
<!-- テーブル名は複数形 -->

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| user_id           | references | null: false, foreign_key: true |
| item_id           | references | null: false, foreign_key: true |
<!-- 外部キーを保存するカラムはreferences型かinteger型 -->
### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| prefectures_id        | integer    | null: false                    |
| municipality          | string     | null: false                    |
| address               | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |
| purchasing control_id | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase

