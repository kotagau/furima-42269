class ItemBuy

include ActiveModel::ActiveModel

# attr_accessor :item,:user,:prefecture_id,:post_code,:address,:building,:phone_number,:bought_item,:city

#   with_options presence: true do
#     validates :prefecture_id
#     validates :post_code
#     validates :address
#     validates :phone_number
#     validates :city
#   end

# validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "only half-width. Include hyphen(-)"}

# validates :phone_number, format: {with: /\A[0-9]\z/,maximum_length:11}


    def save
      @bought_item = BoughtItem.create(item_id: item_id, user_id: user_id)
      @deliver_information=DeliverInformation.create(post_code: post_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number, building: building, address: address , bought_item_id:bought_item_id,)
    end
end
