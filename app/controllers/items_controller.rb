class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show ]
  before_action :find_params, only: [:show, :edit, :update ]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless (current_user.id == @item.user_id)
     redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :item_price, :image ).merge(user_id: current_user.id)
  end

  def find_params
    @item = Item.find(params[:id])
  end

end
