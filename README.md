## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| nickname  | string | null: false |
| last_name | string | null: false |
| first_name| string | null: false |
| birthday  | string | null: false |

### Association

- has_many :items
- belongs_to :address

## items テーブル

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| item_name         | string  | null: false |
| item_explaination | text    | null: false |
| item_category     | string  | null: false |
| item_status       | string  | null: false |
| item_price        | interger| null: false |
| delivery_fee      | string  | null: false |
| delivery_area     | string  | null: false |
| delivery_span     | string  | null: false |


### Association

- belongs_to :user
- belongs_to :address
- has_one :purchase

## address テーブル

| Column      | Type    | Options     |
| --------    | ------  | ----------- |
| postal_code | string  | null: false |
| prefecture  | string  | null: false |
| city        | string  | null: false |
| block       | string  | null: false |
| building    | string  |             |
| phone_number| string  | null: false |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column         | Type      | Options     |
| --------       | ------    | ----------- |
| card_number    | text      | null: false |
| expiration_date| references| null: false |
| security_code  | references| null: false |

### Association

- belongs_to :item