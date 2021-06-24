class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :roduct_status_id
    validates :shipping_charges_id
    validates :prefecture_id
    validates :shipping_date_and_time_id
    validates :price
  end
  belongs_to :user
  has_one :order
  has_one_attached :image
end
