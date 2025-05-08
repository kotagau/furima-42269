class ItemsController < ApplicationController
  
before_action :authenticate_user!, except:[:index]


  def index
  end

  def new
    @item=Item.new
  end

  def create
  Item.create(item_params)
  redirect_to '/'
  end


  private

  def item_params
    params.require(:item).permit(:image , :price , :product_name , :product_explanation , :product_category_id , :product_status_id , :deliver_fee_payment_id , :prefecture_id , :deliver_day_id ,).merge(user_id: current_user.id)
  end
end
