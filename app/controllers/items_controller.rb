class ItemsController < ApplicationController
  
before_action :authenticate_user!, except:[:index,:show]
before_action :item_find,only:[:show,:edit,:update]

  def index
    @items=Item.all.order("created_at DESC")
  end


  def new
    @item=Item.new
  end


  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  def show
  
  end


  def edit
      if current_user.id == @item.user.id
         edit_item_path
      else
        redirect_to root_path
      end
  end

  def update
    if @item.update(item_params)
        redirect_to item_path
    else
        render :edit, status: :unprocessable_entity
    end
  end


  # def delete
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to root_path
  # end



  private

  def item_params
    params.require(:item).permit(:image , :price , :product_name , :product_explanation , :product_category_id , :product_status_id , :deliver_fee_payment_id , :prefecture_id , :deliver_day_id ,).merge(user_id: current_user.id)
  end

  def item_find
    @item=Item.find(params[:id])
  end


end
