# README

## paperdraft of table and relationships ##

## users ##
 
| Column              | Type    | Options                   |
| ------------------  | ------  | --------------------------|
| email               | string  | null: false               |
| encrypted_password  | string  | null: false,unique: true  |
| nickname            | string  | null: false               |
| family_name         | string  | null:false                |
| given_name          | string  | null:false                |
| date_of_birth       | integer | null:flase                |

## association ##

- has_many: bought-items
- has_many: products
- has_many: deliver-informations



## products ##

| Column                 | Type      | Options                       |
| -----------------------| --------- | ------------------------------|
| price                  | string    | null: false                   |
| image                  | text      |                               |
| user_id                | references|null: false,foreign_key: true  |
| product_name           | string    |null:fals                      |
| product_explanation    | text      |null:false                     |
| product_category       | string    |null:false                     |
| product_status         | string    |null:false                     |
| deliver_fee_payment    | string    |null:fale                      |
| deliver_from           | string    |null:false                     |
| deliver_day            | string    |null:false                     |

## association ##

- has_one: bought-items
- belongs_to: users



## bought-items ## who and what item bought

| Column             | Type   | Options                      |
| ------------------ | ------ | -----------------------------|
| products_id        | string | null: false,foreign_key:true |
| user_id            | string | null: false,foreign_key:true |

## association ##

- has_one:deliver-informations




## deliver-informations ##

| Column       | Type     | Options     |
| -------------| -------- | ------------|
| prifecture   | string   | null: false |
| city         | text     | null: false |
| post_code    | integer  | null:false  |
| adress       | string   | null:false  |
| building     | string   | null:false  |
| phone_number | interger | null:false  |


## association ##
belongs_to:users