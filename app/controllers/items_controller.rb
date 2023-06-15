class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: :edit
  

  def index
    @item = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit  
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
    end
    redirect_to items_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:image, :name, :description, :price, :condition_id, :cost_id, :area_id, :day_id, :category_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
    if current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

end
