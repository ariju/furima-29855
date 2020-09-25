## テーブル設計

## users テーブル

| Column          | Type       | Options     |
| ------          | ---------- | ------------|
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kana | string     | null: false |
| birthday        | string     | null: false |

### Association
- has_many :items
- has_many :purchase

## itemsテーブル

| Column                        | Type       | Options                        |
| ------                        | ---------- | ------------------------------ |
| image                         | string     | null: false                    |
| Product name                  | string     | null: false                    |
| Product name description      | string     | null: false                    |
| category_id                   | references | null: false, foreign_key: true |
| product condition_id          | references | null: false, foreign_key: true |
| Burden of shipping charges_id | references | null: false, foreign_key: true |
| shipping area_id              | references | null: false, foreign_key: true |
| Days to ship_id               | references | null: false, foreign_key: true |
| price                         | integer    | null: false                    |
| sales commission              | integer    | null: false                    |
| sales profit                  | integer    | null: false                    |

### Association
- belongs_to :users
- has_one :purchase


## purchaseテーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| card number       | integer    | null: false                    |
| expiration date   | integer    | null: false                    |
| security code     | integer    | null: false                    |

### Association
- belongs_to :users
- has_one :items
- has_one :address

## addressテーブル

| Column            | Type       | Options                        |
| ------            | ---------- | ------------------------------ |
| post_code         | string     | null: false                    |
| prefectures_id    | integer    | null: false, foreign_key: true |
| municipality      | string     | null: false                    |
| address           | string     | null: false, foreign_key: true |
| building name     | string     |                                |
| phone number      | references | null: false, foreign_key: true |

### Association
- has_one :purchase

