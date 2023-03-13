class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
       @buy_address.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :phone_number, :building, :address).merge(user_id: current_user.id, item_id: @item.id)
  end
end
