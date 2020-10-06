class PurchasesController < ApplicationController
  before_action :set_item, only: [:index]
  def set_item
    @item = Item.find(params[:item_id])
    @purchase = UserPurchase.new
  end

  def index
    if set_item.user_id != user_signed_in? && current_user.id
      item_purchases_path
    else
      redirect_to root_path
    end
  end
  
  

  def create
    @purchases = UserPurchase.new(purchases_params)
    if @purchases.valid?
      pay_item
      @purchases.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchases_params
    params.require(:user_purchase).permit(:token, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase,).merge(user_id: current_user.id, item_id: params[:item_id] )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_706b3c7e3c0eaeb1da225804"  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
