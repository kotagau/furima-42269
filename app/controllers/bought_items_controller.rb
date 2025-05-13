class BoughtItemsController < ApplicationController


  def index
    @bought_item = BoughtItem.new
    
    @item = Item.find(params[:item_id])

  end

  def create
    @bought_item = BoughtItem.create(order_params)
    DeliverInformations.create(address_params)
    redirect_to root_path
  end

  
end

private

def order_params
  params.merge(user_id: current_user.id , item_id: current_item.id)
end

def address_params
  params.permit(:post_code , :address , :building , :phone_number , :city ).merge(bought_item_id: current_bought_item.id)