# README

### usersテーブル
|column            |types |Options                |
|------------------|------|-----------------------|
|nickname          |string|null: false            |
|email             |string|null: false            |
|encrypted_password|string|null: false,unique:true|
|family_name       |string|null: false            |
|first_name        |string|null: false            |
|family_name_kana  |string|null: false            |
|first_name_kana   |string|null: false            |
|birthday          |string|null: false            |

### Association
has many :items
has many :buys

### itemsテーブル
|column          |types        |Options                       |
|----------------|-------------|------------------------------|
|item_name       |string       |null: false                   |
|explanation     |text         |null: false                   |
|category_id     |integer      |null: false                   |
|condition_id    |integer      |null: false                   |
|delivery_fee_id |integer      |null: false                   |
|delivery_area_id|integer      |null: false                   |
|delivery_day_id |integer      |null: false                   |
|price           |integer      |null: false                   |
|user            |reference    |null: false, foreign_key: true|

### Association
belongs_to :user
has_one :buy

### buyテーブル
|column     |types    |Options                       |
|-----------|---------|------------------------------|
|item       |reference|null: false, foreign_key: true|
|user       |reference|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :destination

### destinationテーブル
|column      |types  |Options                       |
|--------------|---------|------------------------------|
|postal_code   |string   |null: false                   |
|prefecture_id |integer  |null: false                   |
|addresses     |string   |null: false                   |
|building      |string   |null: false                   |
|phone_number  |string   |null: false                   |
|user          |reference|null: false, foreign_key: true|
|buy           |reference|null: false, foreign_key: true|

### Association
belongs_to :buy
belongs_to :user



