class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    #@item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid? 
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private


  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :cost_id, :area_id, :day_id, :category_id).merge(user_id: current_user.id)
  end

end
