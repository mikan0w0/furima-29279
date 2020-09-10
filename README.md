
# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| family_name| string | null: false |
| first_kana | string | null: false |
| family_kana| string | null: false |
| birth_year | string | null: false |
| birth_month| string | null: false |
| birth_day  | string | null: false |

### Association
- has_many :items
- has_many :item_transaction


## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user        | references | null: false |
| name        | string     | null: false |
| info        | string     | null: false |
| user_address| string     | null: false |
| price       | integer    | null: false |
### Association
- belongs_to :user
- belongs_to :item_transaction

## item_transactionsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |
|ship_to_address| text       | null: false,                   |
| sold?         | boolean    |                                |
### Association
- belongs_to :item
- belongs_to :user

## ship_to テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| address| references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :item_transaction
