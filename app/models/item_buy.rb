class ItemBuy
  include ActiveModel::Model

  attr_accessor :prefecture_id, :post_code, :address, :building, :phone_number, :city, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code
    validates :address
    validates :phone_number
    validates :city
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 1 }

  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'only half-width. Include hyphen(-)' }

  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の半角数字で入力してください' }

  def save
    @bought_item = BoughtItem.create(item_id: item_id, user_id: user_id)
    DeliverInformation.create(post_code: post_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number,
                              building: building, address: address, bought_item_id: @bought_item.id)
  end
end
