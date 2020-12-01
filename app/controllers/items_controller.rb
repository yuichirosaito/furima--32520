class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end  

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id != @item.user_id
      redirect_to root_path
    end  
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explaination, :category_id, :status_id, :price, :delivery_fee_id, :image, :delivery_area_id, :delivery_span_id).merge(user_id: current_user.id)
  end
end
