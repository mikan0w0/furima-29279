
# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| first_name | string | null: false |
| family_name| string | null: false |
| first_kana | string | null: false |
| family_kana| string | null: false |
| birth_date | date   | null: false |

### Association
- has_many :items
- has_many :order


## items テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| user        | references | null: false |
| name        | string     | null: false |
| info        | text       | null: false |
| categories  | integer    | null: false |
| state       | integer    | null: false |
| ship_charge | integer    | null: false |
| ship_from   | integer    | null: false |
| ship_takes  | integer    | null: false |
| price       | integer    | null: false |
### Association
- has_one :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |
### Association
- belongs_to :item
- belongs_to :user
- has_one :ship_to

## ship_tos テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |
| prefecture     | integer    | null: false                    |
| city           | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone          | string     | null: false                    |
### Association
- belongs_to :order
