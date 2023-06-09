class OrdersController < ApplicationController

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

end
