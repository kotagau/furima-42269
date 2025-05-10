class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :deliver_fee_payment
  belongs_to :prefecture
  belongs_to :deliver_day 



  with_options presence: true do
    validates :price
    validates :user
  end


  with_options presence: true,numericality: { other_than: 1 } do
    validates :product_category_id 
    validates :product_status_id
    validates :deliver_fee_payment_id 
    validates :prefecture_id 
    validates :deliver_day_id         
  end

 validates :price, presence: true,numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


 validates :product_name, presence: true, length: { maximum: 40 }
 validates :product_explanation , presence:true , length: { maximum: 1000 }

end
