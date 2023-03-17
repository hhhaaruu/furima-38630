class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_params, only: [:index, :create]
  
  def index
    @buy_address = BuyAddress.new
    if current_user.id == @item.user_id || @item.buy.present?
      redirect_to root_path
    end
  end


  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
       pay_item 
       @buy_address.save
       redirect_to root_path
    else
       render :index
    end
  end

  private

  def find_params
    @item = Item.find(params[:item_id])
  end

  def buy_params
    params.require(:buy_address).permit(:postal_code, :prefecture_id, :city, :phone_number, :building, :address).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.item_price,  # 商品の値段
        card: buy_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
