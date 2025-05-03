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

- has_many: bought-items
- has_many: products




## products ##

| Column                 | Type      | Options                       |
| -----------------------| --------- | ------------------------------|
| price                  | interger  |null:false                     |
| user                   | references|null:false,foreign_key: true   |
| product_name           | string    |null:fals                      |
| product_explanation    | string    |null:false                     |
| product_category_id    | interger  |null:false                     |
| product_status_id      | interger  |null:false                     |
| deliver_fee_payment_id | interger  |null:fale                      |
| prefecture_id          | interger  |null:false                     |
| deliver_day_id         | interger  |null:false                     |

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
has_one:product




## deliver_informations ##

| Column       | Type       | Options                    |
| -------------| -----------| ---------------------------|
| prefecture_id| interger   | null: false                |
| post_code    | string     | null:false                 |
| address      | string     | null:false                 |
| building     | string     |                            |
| phone_number | string     | null:false                 |
| bought_item  | references | null:false,foreign_key:true|

## association ##