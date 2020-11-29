class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true do
    validates :nickname
    validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i}
    validates :birthday
    with_options format: format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width katakana characters."} do
     validates :first_name_kana
     validates :last_name_kana
      with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."} do
       validates :first_name
       validates :last_name
      end 
    end
  end
end