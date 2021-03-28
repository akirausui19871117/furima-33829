class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one :buy
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price,  inclusion: { in: 300..9_999_999 ,message:'Out of setting range'}, format: { with: /\A[0-9]+\z/ ,message:'half-width number'}
    with_options numericality: { other_than: 1 ,message: 'Select'} do
      validates :category_id 
      validates :condition_id
      validates :delivery_fee_id
      validates :prefecture_id
      validates :delivery_day_id
    end
  end
end
