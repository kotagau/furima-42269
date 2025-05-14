class BoughtItemsController < ApplicationController

before_action :authenticate_user!, only:[:index]

    def index
     gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
     @item = Item.find(params[:item_id])
     if user_signed_in? 
     if current_user.id == @item.user.id
      redirect_to root_path
     else
      @bought_item = ItemBuy.new
      end

      if @item.bought_item.present?
        redirect_to root_path
      else

      end

    end


def create
   @item = Item.find(params[:item_id])
   @bought_item = ItemBuy.new(order_params)
  
  if @bought_item.valid?
    pay_item
    @bought_item.save 
    redirect_to root_path
  else
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    render 'index', status: :unprocessable_entity
  end
end

def pay_item
  Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
  @item = Item.find(params[:item_id])
  Payjp::Charge.create(
    amount:    @item[:price],
    card:      params[:token],
    currency:  'jpy'
    )
end

end







private

def order_params
   params.require(:item_buy).permit(:amount,:post_code , :address , :building , :phone_number , :city , :prefecture_id ).merge(item_id: params[:item_id],token: params[:token],user_id: current_user.id)
end



end
