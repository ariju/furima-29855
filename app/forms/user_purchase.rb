class UserPurchase

  include ActiveModel::Model
  attr_accessor :user_purshase, :user_id, :price, :item_id, :token, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_id
  
  def save
   
    Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, phone_number: phone_number)
  end
end