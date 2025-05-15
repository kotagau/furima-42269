class BoughtItemsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :item_find, only:[:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']

    if current_user.id == @item.user.id||@item.bought_item.present?
      redirect
    end

    @bought_item = ItemBuy.new

  end

  def create
    @bought_item = ItemBuy.new(order_params)
    if @bought_item.valid?
      pay_item
      @bought_item.save
      redirect
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render 'index', status: :unprocessable_entity
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: params[:token],
      currency: 'jpy'
    )
  end

private

def order_params
  params.require(:item_buy).permit(:amount, :post_code, :address, :building, :phone_number, :city, :prefecture_id).merge(item_id: params[:item_id], token: params[:token], user_id: current_user.id)
end

def item_find
  @item = Item.find(params[:item_id])
end

def redirect
redirect_to root_path
end

end


