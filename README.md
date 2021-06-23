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
 | birthday_year      | string    |  null: false                |
 | birthday_month     | string    |  null: false                |
 | birthday_day       | string    |  null: false                |
 
 ### Association
 - has_many :items
 - has_many :orders
 - has_many :comments



## Itemsテーブル
 |  Column                | Type      |   Options                       |
 |------------------------|-----------|---------------------------------|
 | image                  | string    |  null: false                    |
 | name                   | string    |  null: false                    |
 | description            | text      |  null: false                    |
 | category               | string    |  null: false                    |
 | product status         | string    |  null: false                    |
 | shipping charges       | string    |  null: false                    |
 | shipping area          | string    |  null: false                    |
 | shipping date and time | string    |  null: false                    |
 | price                  | string    |  null: false                    |
 | user                   | reference |  null: false, foreign_key: true |

 ### Association
 - belongs_to :user
 - has_one :order
 - has_many :comments



## Ordersテーブル
 |  Column                | Type      |   Options                       |
 |------------------------|-----------|---------------------------------|
 | price                  | string    |  null: false                    |
 | item                   | reference |  null: false, foreign_key: true | 
 | addresses              | reference |  null: false, foreign_key: true |
 | user                   | reference |  null: false, foreign_key: true |
 
 ### Association
 - belongs_to :user
 - belongs_to :item
 - has_one :addresses



## Addressesテーブル
 |  Column                | Type      |   Options                       |
 |------------------------|-----------|---------------------------------|
 | postal_code            | string    |  null: false                    |
 | prefectures            | string    |  null: false                    | 
 | municipalities         | string    |  null: false                    |
 | building               | string    |  null: false                    |
 | phone_number           | string    |  null: false                    |
 | order                  | reference |  null: false, foreign_key: true |

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
