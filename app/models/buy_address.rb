class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :token, :postal_code, :prefecture_id, :city, :house_number, :phone_number,
                :building_name

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :house_number
    validates :phone_number, numericality: { message: 'Input only number' }, length: { maximum: 11 }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    # カード情報を入力し、変数buyに代入する
    buy = Buy.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # buy_idには変数buyのidを指定する。
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, phone_number: phone_number,
                   house_number: house_number, building_name: building_name, buy_id: buy.id)
  end
end
