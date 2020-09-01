class ProceduresController < ApplicationController

  before_action :move_to_sign_in


  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end


  def create
    @order = Order.create(order_params)
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


  private

  def order_params
    params.require(:order).permit(:token, :post_number, :prefecture_id, :city, :address, :billing_address_line, :phone_number).merge(:user_id, :item_id)
  end

  def pay_item
    Payjp.api_key = "sk_test_dd98d9fc72b15097812528e6"
    Payjp::Charge.create(
      amount: item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
