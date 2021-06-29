class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :shipping_charges_id
      validates :prefecture_id
      validates :shipping_date_and_time_id
    end
    validates_inclusion_of :price, in: 300..999_999_999
  end

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charges
  belongs_to :prefecture
  belongs_to :shipping_date_and_time
end
