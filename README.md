# テーブル設計

## Usersテーブル
 |  Column            | Type      |   Options                   |
 |--------------------|-----------|-----------------------------|
 | nickname           | string    |  null: false, unique: true  |
 | email              | string    |  null: false, unique: true  |
 | encrypted_password | string    |  null: false                |
 | last_name          | string    |  null: false                |
 | first_name         | string    |  null: false                |
 | last_name_kana     | string    |  null: false                |
 | first_name_kana    | string    |  null: false                |
 | birthday           | date      |  null: false                |
 
 ### Association
 - has_many :items
 - has_many :orders
 - has_many :comments



## Itemsテーブル
 |  Column                   | Type       |   Options                       |
 |---------------------------|------------|---------------------------------|
 | name                      | string     |  null: false                    |
 | description               | text       |  null: false                    |
 | category_id               | integer    |  null: false                    |
 | product_status_id         | integer    |  null: false                    |
 | shipping_charges_id       | integer    |  null: false                    |
 | shipping area_id          | integer    |  null: false                    |
 | shipping date and time_id | integer    |  null: false                    |
 | price                     | integer    |  null: false                    |
 | user                      | references |  null: false, foreign_key: true |

 ### Association
 - belongs_to :user
 - has_one :order
 - has_many :comments



## Ordersテーブル
 |  Column                | Type       |   Options                       |
 |------------------------|------------|---------------------------------|
 | item                   | references |  null: false, foreign_key: true |
 | user                   | references |  null: false, foreign_key: true |
 
 ### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :addresses



## Addressesテーブル
 |  Column                | Type       |   Options                       |
 |------------------------|------------|---------------------------------|
 | postal_code            | string     |  null: false                    |
 | prefectures            | string     |  null: false                    | 
 | municipalities         | string     |  null: false                    |
 | building               | string     |  null: false                    |
 | phone_number           | string     |  null: false                    |
 | order                  | references |  null: false, foreign_key: true |

 ### Association
 - belongs_to :order



 ## Commentsテーブル
 |  Column                | Type      |   Options                       |
 |------------------------|-----------|---------------------------------|
 | text                   | text      |  null: false                    |
 | item                   | reference |  null: false, foreign_key: true | 
 | user                   | reference |  null: false, foreign_key: true |
 
 ### Association
 - belongs_to :item
 - belongs_to :user
