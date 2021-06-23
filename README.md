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
 | shipping_area_id          | integer    |  null: false                    |
 | shipping_date_and_time_id | integer    |  null: false                    |
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
 - has_one :address



## Addressesテーブル
 |  Column                | Type       |   Options                       |
 |------------------------|------------|---------------------------------|
 | postal_code            | string     |  null: false                    |
 | prefectures_id         | integer    |  null: false                    | 
 | municipalities         | string     |  null: false                    |
 | building               | string     |                                 |
 | address                | string     |  null: false                    |
 | phone_number           | integer    |  null: false                    |
 | order                  | references |  null: false, foreign_key: true |

 ### Association
 - belongs_to :order



 ## Commentsテーブル
 |  Column                | Type       |   Options                       |
 |------------------------|------------|---------------------------------|
 | text                   | text       |  null: false                    |
 | item                   | references |  null: false, foreign_key: true | 
 | user                   | references |  null: false, foreign_key: true |
 
 ### Association
 - belongs_to :item
 - belongs_to :user
