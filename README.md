# README

###users テーブル
|column    |types |Options    |
|----------|------|-----------|
|nickname  |string|null: false|
|email     |string|null: false|
|password  |string|null: false|
|name      |string|null: false|
|birthday  |string|null: false|

###Association
has many :items
has many :buys

###items テーブル
|column    |types         |Options                       |
|-----------|-------------|------------------------------|
|item_name  |string       |null: false                   |
|explanation|text         |null: false                   |
|price      |integer      |null: false                   |
|user       |reference    |null: false, foreign_key: true|

###Association
belongs_to :user
has_one :buy

###buy テーブル
|column     |types    |Options                       |
|-----------|---------|------------------------------|
|user       |reference|null: false, foreign_key: true|
|destination|reference|null: false, foreign_key: true|

###Association
belongs_to :user
belongs_to :item
has_one :destination

###destination テーブル
|column      |types  |Options                       |
|------------|-------|------------------------------|
|postal_code |string |null: false                   |
|prefecture  |string |null: false                   |
|addresses   |string |null: false                   |
|building    |string |null: false                   |
|phone_number|string |null: false                   |
|user        |string |null: false, foreign_key: true|

###Association
belongs_to :buy




