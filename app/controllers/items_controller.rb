class ItemsController < ApplicationController
  #def index
    #@items = Item.all
  #end

  def new
    @item = Item.new
  end  

  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explaination, :category_id, :status_id, :price, :delivery_fee_id, :image, :delivery_area_id, :delivery_span_id).merge(user_id: current_user.id)
  end
end
