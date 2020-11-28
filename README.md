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
| birthday          | string | null: false              |
| user_id           | integer| null: false              |

### Association

- has_many :items

## items テーブル

| Column          | Type    | Options     |
| --------        | ------  | ----------- |
| name            | string  | null: false |
| explaination    | text    | null: false |
| category        | string  | null: false |
| status_id       | integer | null: false |
| price           | interger| null: false |
| delivery_fee_id | integer | null: false |
| delivery_area_id| integer | null: false |
| delivery_span_id| integer | null: false |


### Association

- belongs_to :user
- has_one :purchase

## address テーブル

| Column         | Type    | Options     |
| --------       | ------  | ----------- |
| postal_code_id | integer | null: false |
| prefecture_id  | integer | null: false |
| city           | string  | null: false |
| block          | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :purchase

## purchases テーブル

| Column  | Type     | Options     |
| --------| ------   | ----------- |
| who     | string   | null: false |
| what    | string   | null: false |

### Association

- belongs_to :item