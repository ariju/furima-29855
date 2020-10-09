class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @purchases = UserPurchase.new
    if current_user.id != @item.user_id && @item.purchase.nil?
    else
      redirect_to root_path
    end
  end

  def create
    @purchases = UserPurchase.new(purchases_params)
    if @purchases.valid?
      pay_item
      @purchases.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchases_params
    params.require(:user_purchase).permit(:post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase_id).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
