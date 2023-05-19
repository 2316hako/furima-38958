## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| email           | string | null: false |
| user_password   | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | string | null: false |

### Association
has_many :items
belongs_to :shared
has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | string     | null: false                    |
| price       | string     | null: false                    |
| condition   | string     | null: false                    |
| cost        | string     | null: false                    |
| area        | string     | null: false                    |
| days        | string     | null: false                    |
| category    | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
belongs_to :user

## shared テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefectures      | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone_number | string     | null: false                    |
| first_name       | string     | null: false                    |
| last_name        | string     | null: false                    |
| user             | references | null: false, foreign_key: true |
| order            | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| record | string     | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
belongs_to :user