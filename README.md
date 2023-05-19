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
belongs_to :shared
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
belongs_to :order

## shared テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| post_code_id     | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city_id          | integer    | null: false                    |
| address_id       | integer    | null: false                    |
| building_name_id | integer    |                                |
| telephone_number | string     | null: false                    |
| order            | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_many :items