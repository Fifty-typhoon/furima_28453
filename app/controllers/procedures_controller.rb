class ProceduresController < ApplicationController

  before_action :move_to_sign_in
  before_action :make_instance, only: [:index, :new]
  before_action :find_instance, only: [:index, :create]

  def index
    if (current_user.id == @item.user_id) || (@item.purchase.present?)
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order = OrderPurchase.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  def move_to_sign_in
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

  def make_instance
    @order = OrderPurchase.new
  end

  def find_instance
    @item = Item.find(params[:item_id])
  end


  
  private

  def order_params
    params.permit(:token, :post_number, :prefecture_id, :city, :address, :billing_address_line, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECLET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
