class Item < ApplicationRecord
<<<<<<< Updated upstream
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
=======
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
>>>>>>> Stashed changes
  belongs_to_active_hash :category  
  belongs_to_active_hash :product_condition 
  belongs_to_active_hash :burden_of_shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship
<<<<<<< Updated upstream
end
=======

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_name_description
  end
  # validates :price,numericality: { only_integer: true,greater_than: 300, less_than: 10000}
  validates :text,:category_id,:product_condition_id,:burden_of_shipping_charges_id,:shipping_area_id,:days_to_ship_id,:user_id, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end 


>>>>>>> Stashed changes


