class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.all
  end
end

  private

  def item_params
    params.require(:item).permit(:image)
  end


