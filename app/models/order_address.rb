class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :municipalities, :building, :address, :phone_number, :order_id, :item_id ,:user_id
  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Enter your phone number"}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture, municipalities: municipalities, building: building, address: address, phone_number: phone_number, order_id: order.id)
  end
end