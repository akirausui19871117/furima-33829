class Item < ApplicationRecord
  belongs_to :user
  has_one :buy

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :presence_id
    validates :delivery_day_id
    validates :price
end
