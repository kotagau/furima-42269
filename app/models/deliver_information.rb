class DeliverInformation < ApplicationRecord

  belongs_to :bought_item

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  
end
