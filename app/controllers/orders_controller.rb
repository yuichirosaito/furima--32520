class OrdersController < ApplicationController

    def index
      @item = Item.find(params[:item_id])
      if user_signed_in? && current_user.id == @item.user_id
        redirect_to root_path
      end  
      if user_signed_in?
      @item = Item.find(params[:item_id])
      @order_form = OrderForm.new
      else
        redirect_to  new_user_session_path
      end  
    end
   
    def create  
      @order_form = OrderForm.new(order_params)
      @item = Item.find(params[:item_id])
      if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
      else
      render 'index'
      end
    end
    
      private
    
      def order_params
        params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
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

