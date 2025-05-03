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
| image                  | text      |null:false                     |
| user_id                | references|null:false,foreign_key: true   |
| product_name           | string    |null:fals                      |
| product_explanation    | text      |null:false                     |
| product_category       | string    |null:false                     |
| product_status         | string    |null:false                     |
| deliver_fee_payment    | string    |null:fale                      |
| deliver_from           | string    |null:false                     |
| deliver_day            | string    |null:false                     |

## association ##

- has_one: bought_item
- belongs_to: user



## bought-items ## 

| Column             | Type   | Options                      |
| ------------------ | ------ | -----------------------------|
| products           | string | null: false,foreign_key:true |
| user               | string | null: false,foreign_key:true |

## association ##

-has_one:deliver_information




## deliver-informations ##

| Column       | Type     | Options                    |
| -------------| -------- | ---------------------------|
| prifecture   | string   | null: false                |
| city         | string   | null: false                |
| post_code    | string   | null:false                 |
| address      | string   | null:false                 |
| building     | string   |                            |
| phone_number | string   | null:false                 |
| products     | interger | null:false,foreign_key:true|


## association ##