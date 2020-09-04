class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :generate_instance, except: [:index, :new, :create]

  def index
    @item = Item.order('created_at DESC')
  end

  def show
  end

  def new # 出品ページの表示アクション
    @item = Item.new
  end

  def create # 出品のデータを登録するときのアクション
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def move_to_sign_in
    redirect_to user_session_path unless user_signed_in?
  end

  def generate_instance
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :detail, :category_id, :state_id, :delivery_fee_id, :ship_from_location_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
