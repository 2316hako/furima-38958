class OrdersController < ApplicationController
  before_action :move_to_signed_in, expect: [:index]
  before_action :move_to_index, only: [:index]
  before_action :prevent_url, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @order = OrderShared.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderShared.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_shared).permit(:post_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to '/users/sign_in'
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def prevent_url
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end

end
