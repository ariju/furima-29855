class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category  
  belongs_to_active_hash :product_condition 
  belongs_to_active_hash :burden_of_shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
end


