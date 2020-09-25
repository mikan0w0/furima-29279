class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create, :move_to]
  before_action :move_to

  def index
    @order = Order.new
  end
  def create
    @order = OrderShipTo.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  def move_to
    if user_signed_in? 
      if @item.user_id == current_user.id || Order.find_by(item_id: @item.id)
        redirect_to root_path
      end
    else
      redirect_to user_session_path
    end
  end
  def order_params
    params.permit(:token, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
