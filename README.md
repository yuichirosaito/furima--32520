## users テーブル

| Column            | Type   | Options                  |
| --------          | ------ | -----------              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| nickname          | string | null: false              |
| last_name         | string | null: false              |
| first_name        | string | null: false              |
| last_name_kana    | string | null: false              |
| first_name_kana   | string | null: false              |
| birthday          | date   | null: false              |          

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| explaination    | text    | null: false |
| category_id     | integer | null: false |
| status_id       | integer | null: false |
| price           | interger| null: false |
| delivery_fee_id | integer | null: false |
| delivery_area_id| integer | null: false |
| delivery_span_id| integer | null: false |
| uer_id          |reference| null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :purchase

## address テーブル

| Column         | Type    | Options     |
| --------       | ------  | ----------- |
| postal_code    | string  | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| block          | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false |

### Association

- has_one :purchase

## purchases テーブル

| Column  | Type     | Options     |
| --------| ------   | ----------- |
| user_id | reference| null: false, foreign_key: true |
| item_id | reference| null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :address