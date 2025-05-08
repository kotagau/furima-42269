class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product_category
  belongs_to :product_status
  belongs_to :deliver_fee_payment
  belongs_to :prefecture
  belongs_to :deliver_day 


# validates :price                  , presence:true , 
# validates :user                   , presence:true , foreign_key_:true
# validates :product_name           , presence:true
# validates :product_explanation    , presence:true
# validates :product_category_id    , presence:true , numericality: { other_than: 1 } 
# validates :product_status_id      , presence:true , numericality: { other_than: 1 } 
# validates :deliver_fee_payment_id , presence:true , numericality: { other_than: 1 } 
# validates :prefecture_id          , presence:true , numericality: { other_than: 1 } 
# validates :deliver_day_id         , presence:true , numericality: { other_than: 1 } 


end


