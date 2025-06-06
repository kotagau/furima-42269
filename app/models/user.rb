class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :bought_items

  validates :nickname, presence: true
  validates :date_of_birth, presence: true

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full_width only for given_name and given_name' } do
    validates :given_name
    validates :given_name_read
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: 'number and alphabet is necessary for password'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'full_width only for given_name and given_name' } do
    validates :family_name
    validates :family_name_read
  end
end
