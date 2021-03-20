class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :email,                 uniqueness: true
         validates :password,format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/, message: "Include both letters and numbers" }
         with_options presence: true do
           validates :nickname
           validates :birthday
           with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"} do
            validates :family_name 
            validates :first_name
           end
           with_options format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "Full-width katakana characters" } do
             validates :family_name_kana
             validates :first_name_kana
           end
         end
end
