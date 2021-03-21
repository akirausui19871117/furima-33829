# README

### usersテーブル
|column            |types |Options                |
|------------------|------|-----------------------|
|nickname          |string|null: false            |
|email             |string|null: false,unique:true|
|encrypted_password|string|null: false            |
|family_name       |string|null: false            |
|first_name        |string|null: false            |
|family_name_kana  |string|null: false            |
|first_name_kana   |string|null: false            |
|birthday          |date  |null: false            |

### Association
has many :items
has many :buys

### itemsテーブル
|column          |types         |Options                     |
|----------------|--------------|----------------------------|
|name            |string        |null: false                 |
|explanation     |text          |null: false                 |
|category_id     |integer       |null: false                 |
|condition_id    |integer       |null: false                 |
|delivery_fee_id |integer       |null: false                 |
|prefecture_id   |integer       |null: false                 |
|delivery_day_id |integer       |null: false                 |
|price           |integer       |null: false                 |
|user            |references    |foreign_key: true           |

### Association
belongs_to :user
has_one :buy

### buysテーブル
|column     |types    　|Options             |
|-----------|----------|-------------------|
|item       |references|foreign_key: true  |
|user       |references|foreign_key: true  |

### Association
belongs_to :user
belongs_to :item
has_one :destination

### destinationsテーブル
|column        |types     |Options            |
|--------------|----------|-------------------|
|postal_code   |string    |null: false        |
|prefecture_id |integer   |null: false        |
|city          |string    |null: false        |
|addresses     |string    |null: false        |
|building      |string    |                   |
|phone_number  |string    |null: false        |
|buy           |references|foreign_key: true  |

### Association
belongs_to :buy




