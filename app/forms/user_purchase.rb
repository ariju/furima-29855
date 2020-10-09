class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_purshase, :user_id, :price, :item_id, :token, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :token
    validates :post_code
    validates :municipality
    validates :address
    validates :phone_number
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :shipping_area_id
  end

  # with_options length: { maximum: 11, message: 'input only number' } do
  #   validates :phone_number
  # end

  with_options format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' } do
    validates :post_code
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, phone_number: phone_number, purchase_id: purchase.id)
  end
end
