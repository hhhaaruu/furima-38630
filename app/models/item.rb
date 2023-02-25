class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  belongs_to :sales_status
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :item_name
    validates :item_info
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
    format: { with: /\A[0-9]+\z/ }

    validates :image
  end

  with_options numericality: { other_than: 0 , message: "Can't be blanck"} do
    validates :category_id
    validates :prefecture_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
    validates :sales_status_id
  end

  
end
