class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :burden_of_shipping_charges
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :days_to_ship

  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_name_description
  end
  # validates :text,
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :product_condition_id, numericality: { other_than: 1, message: 'Select' }
  validates :burden_of_shipping_charges_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_area_id, numericality: { other_than: 1, message: 'Select' }
  validates :days_to_ship_id, numericality: { other_than: 1, message: 'Select' }
  # validates :user_id, numericality: { other_than: 1 ,message: 'Select'}
  with_options format: { with: /\A[0-9]+\z/, message: 'Half-width number' } do
    validates :price
  end
end
# validates :price,numericality: { only_integer: true,greater_than: 300, less_than: 10000}
