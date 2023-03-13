class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999_9999_9999 }, format: { with: /\A[0-9]+\z/ }
  end
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id )
    Address.create(postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number, prefecture_id: prefecture_id, buy_id: buy.id)
  end
end