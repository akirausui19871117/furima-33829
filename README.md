# README

### usersテーブル
|column    |types |Options    |
|--------------|------|-----------|
|nickname         |string|null: false|
|email            |string|null: false|
|password         |string|null: false|
|family_name      |string|null: false|
|first_name       |string|null: false|
|family_name_kana |string|null: false|
|first_name_kana  |string|null: false|
|birthday         |string|null: false|

### Association
has many :items
has many :buys

### itemsテーブル
|column     |types        |Options                       |
|-------------|-------------|------------------------------|
|item_name    |string       |null: false                   |
|explanation  |text         |null: false                   |
|category     |string       |null: false                   |
|condition    |string       |null: false                   |
|delivery_fee |string       |null: false                   |
|delivery_area|string       |null: false                   |
|delivery_days|string       |null: false                   |
|price        |integer      |null: false                   |
|user         |reference    |null: false, foreign_key: true|

### Association
belongs_to :user
has_one :buy

### buyテーブル
|column     |types    |Options                       |
|-----------|---------|------------------------------|
|items      |reference|null: false, foreign_key: true|
|user       |reference|null: false, foreign_key: true|
|destination|reference|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :destination

### destinationテーブル
|column      |types  |Options                       |
|------------|-------|------------------------------|
|postal_code |string |null: false                   |
|prefecture  |string |null: false                   |
|addresses   |string |null: false                   |
|building    |string |null: false                   |
|phone_number|string |null: false                   |
|user        |string |null: false, foreign_key: true|

### Association
belongs_to :buy




