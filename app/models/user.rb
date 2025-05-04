class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname         , presense:true
  validates :family_name      , presense:true
  validates :given_name       , presense:true
  validates :family_name_read , presense:true
  validates :given_name_read  , presense:true
  validates :date_of_birth    , presense:true
  

end
