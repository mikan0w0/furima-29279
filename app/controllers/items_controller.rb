class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      redirect_to new_item_path #imageデータが取れないためパス指定
    end
  end
  def index
    @items = Item.all.order("created_at DESC")
    @order = Order.all
  end
  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end
  private
  def item_params
    params.require(:item).permit(:name, :info, :price, :category_id, :state_id, :charge_id, :prefecture_id, :take_id, images: [] ).merge(user_id: current_user.id)
  end
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  def set_item
    @item = Item.find(params[:id])
  end

end
