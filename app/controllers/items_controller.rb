class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def index
    @items = Item.all()
  end

  private

  def item_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  def index
  end
end
