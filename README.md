## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| name          | string | null: false |
| email         | string | null: false |
| user_password | string | null: false |

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| price       | string     | null: false                    |
| description | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

## shared テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| first_name | string     | null: false                    |
| last_name  | string     | null: false                    |
| address    | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| record | string     | null: false                    |
| user   | references | null: false, foreign_key: true |