class ItemsController < ApplicationController

  before_action :move_to_sign_in, except: [:index, :show]
  def index
    #@item = Item.all
  end
  
  def show
  end

  def new #出品ページの表示アクション
    @item = Item.new
    #render :new
  end

  def create #出品のデータを登録するときのアクション
    Item.create(item_params)
    redirect_to root_path
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :image, :price)
  end
end
