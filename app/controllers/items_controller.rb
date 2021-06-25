class ItemsController < ApplicationController
  def index
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.save
  end

  private
  def item_params
    params.require(:items).permit(:name, :description, :category_id, :product_status_id, :shipping_charges_id, :prefecture_id, :shipping_date_and_time_id, :price, :image).merge(user_id: current_user.id)
    end
  end

