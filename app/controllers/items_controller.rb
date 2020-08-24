class ItemsController < ApplicationController

  before_action :move_to_sign_in, except: [:index, :show]
  def index
    #@item = Item.all
  end
  
  def show
  end

  def new #出品ページの表示アクション
    @item = Item.new
  end

  def create #出品のデータを登録するときのアクション
    @item = Item.create(item_params)
    binding.pry
    redirect_to root_path
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :state_id, :delivery_fee_id, :ship_from_location_id, :delivery_date_id, :price) #.merge(user_id: current_user.id)
  end
end
