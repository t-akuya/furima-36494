class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_action, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
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
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :price, :condition_id, :text, :delivery_id, :prefecture_id, :shipment_days_id, :user_id).merge(user_id: current_user.id)
  end

  def set_action
    @item = Item.find(params[:id])
  end