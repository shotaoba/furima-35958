class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    binding.pry
    if @order_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture, :municipalities, :building, :address, :phone_number ).merge(user_id: current_user.id ,item_id: params[:item_id],token: params[:token])
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end