## users テーブル

| Column               | Type   | Options                       |
| -------------------- | ------ | ----------------------------- |
| name                 | string | null: false                   |
| email                | string | null: false, uniqueness: true |
| encrypted_password   | string | null: false                   |
| first_name           | string | null: false                   |
| last_name            | string | null: false                   |
| first_name_kana      | string | null: false                   |
| last_name_kana       | string | null: false                   |
| birthday             | date   | null: false                   |

### Association
has_many :items
has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| cost_id      | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| day_id       | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order

## shareds テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
belongs_to :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :shared
belongs :item