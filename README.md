# README

## paperdraft of table and relationships ##

## users ##
 
| Column              | Type    | Options                   |
| ------------------  | ------  | --------------------------|
| email               | string  | null:false,unique: true   |
| encrypted_password  | string  | null:false                |
| nickname            | string  | null:false                |
| family_name         | string  | null:false                |
| given_name          | string  | null:false                |
| family_name_read    | string  | null:false                |
| given_name_read     | string  | null:false                |
| date_of_birth       | date    | null:false                |


## association ##

- has_many: bought_items
- has_many: products




## products ##

| Column                 | Type      | Options                       |
| -----------------------| --------- | ------------------------------|
| price                  | integer   |null:false                     |
| user                   | references|null:false,foreign_key: true   |
| product_name           | string    |null:false                     |
| product_explanation    | text      |null:false                     |
| product_category_id    | integer  |null:false                     |
| product_status_id      | integer  |null:false                     |
| deliver_fee_payment_id | integer  |null:fale                      |
| prefecture_id          | integer  |null:false                     |
| deliver_day_id         | integer  |null:false                     |

## association ##

- has_one: bought_item
- belongs_to: user



## bought_items ## 

| Column             | Type       | Options                      |
| ------------------ | ---------- | -----------------------------|
| product            | references | null: false,foreign_key:true |
| user               | references | null: false,foreign_key:true |

## association ##

-has_one:deliver_information
-belongs_to:user
belongs_to:product




## deliver_informations ##

| Column       | Type       | Options                    |
| -------------| -----------| ---------------------------|
| prefecture_id| integer   | null: false                |
| post_code    | string     | null:false                 |
| address      | string     | null:false                 |
| building     | string     |                            |
| phone_number | string     | null:false                 |
| bought_item  | references | null:false,foreign_key:true|
|city          | string     | null:false                 |

## association ##
belongs_to:bought_item