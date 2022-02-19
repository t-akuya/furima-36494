class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
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

end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :price, :condition_id, :text, :delivery_id, :prefecture_id, :shipment_days_id)
  end