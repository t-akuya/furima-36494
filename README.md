# テーブル設計

## users テーブル

| Column             | Type     | Options         |
| ------------------ | ------   | ----------------|
| nickname           | string   | null: false     |
| email              | string   | null: false     |
| encrypted_password | string   | null: false     |
| first_name         | string   | null: false     |
| last_name          | string   | null: false     |
| birth_day          | datetime | null: false     |

### Association
- has_many :items
- has_many :purchase
- has_one  :address

## items テーブル

| Column             | Type          | Options                           |
| ------------------ | ------------- | --------------------------------- |
| name               | string        | null: false                       |
| category           | string        | null: false                       |
| price              | integer       | null: false                       |
| condition          | string        | null: false                       |
| text               | text          | null: false                       |
| user_id            | references    | null: false, foreign_key: true    |


## addresses テーブル

| Column             | Type       | Options                           |
| ------------------ | -----------| --------------------------------- |
| postal_code        | integer    | null: false                       |
| prefecture         | string     | null: false                       |
| city               | string     | null: false                       |
| house_number       | string     | null: false                       |
| building_name      | string     | null: false                       |
| phone_number       | integer    | null: false                       |
| user_id            | references | null: false, foreign_key: true    |

## Association
- belongs_to :user
- has_many :item
- has_one :address


## purchase テーブル

| Column             | Type          | Options                           |
| ------------------ | ------------- | --------------------------------- |
| user_id            | references    | null: false, foreign_key: true    |
| item_id            | references    | null: false, foreign_key: true    |

## Association
- has_many :item
- belongs_to :address