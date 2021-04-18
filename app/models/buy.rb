class Buy < ApplicationRecord
  attr_accessor :postal_code,:prefecture_id, :city, :house_number, :building_name,:phone_number
  has_one :address
  
  
end
