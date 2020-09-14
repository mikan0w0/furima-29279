class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :search]
  # def create
  #   @tweet = Tweet.new(tweet_params)
  #   #バリデーションで問題があれば、保存はされず「投稿画面」に戻る
  #   if @tweet.valid?
  #     @tweet.save
  #     redirect_to root_path
  #   else
  #     #保存されなければ、newに戻る
  #     render 'new'
  #   end
  # end
  def index
    @items = Item.all()
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
