class BoughtItem < ApplicationRecord

has_one :deliver_information
belongs_to :user
has_one :item

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :prefecture

end
