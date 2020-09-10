
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
### Association
- has_many :items


## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| user_id     | string | null: false |
| image       | string | null: false |
| name        | string | null: false |
| info        | string | null: false |
| user_address| string | null: false |
| price       | integer| null: false |
### Association
- belongs_to :user
- belongs_to :ship_to


## ship_to テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item_id| references | null: false, foreign_key: true |
| address| references | null: false, foreign_key: true |
### Association
- belongs_to :item
