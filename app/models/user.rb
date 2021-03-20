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
         validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
         validates :first_name,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
         validates :family_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "Full-width katakana characters" }
         validates :first_name_kana,  format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "Full-width katakana characters" }
         end

end
