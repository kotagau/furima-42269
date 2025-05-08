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
    validates :product_name
    validates :product_explanation
  end


  with_options presence: true,numericality: { other_than: 1 } do
  validates :product_category_id 
  validates :product_status_id
  validates :deliver_fee_payment_id 
  validates :prefecture_id 
  validates :deliver_day_id         
  end

 validates :price, presence: true,
 format: { with: /\A[0-9]+\z/, message: "は半角数字のみで入力してください" },
 numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }




end
