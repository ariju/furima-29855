class ItemsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    redirect_to "/item/#{item.email.id}"
  end

  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end

  private
  def item_params
    params.repuire(:item).permit(:text,:product_name,:product_name_description,:category_id,:product_condition_id,:burden_of_shipping_charges_id,:shipping_area_id,:days_to_ship_id,:price,:image,).merge(user_id: current_user.id)
  end

end
