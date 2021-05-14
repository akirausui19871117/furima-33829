require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入機能' do
    context '購入ができる場合' do
      it 'すべてのデータが入力されていればできる' do
        expect(@buy_address).to be_valid
      end

      it '建物名が空でも投稿できる' do
        @buy_address.building_name = ' '
        expect(@buy_address).to be_valid
      end
    end

    context '商品が購入できない' do
      it 'カード情報が空では投稿できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では投稿できない' do
        @buy_address.postal_code = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフン（ー）含まれていないととうろくできない' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code Input correctly')
      end

      it 'prefecture_idが未選択の場合は登録できないこと' do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Prefecture Select')
      end

      it '市区町村が空では投稿できない' do
        @buy_address.city = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @buy_address.house_number = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号が空では登録できない' do
        @buy_address.phone_number = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は半角でないと登録できない' do
        @buy_address.phone_number = '０９０１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number Input only number')
      end

      it '電話番号が12桁以上の場合は登録できないこと' do
        @buy_address.phone_number = '090090909090'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it '電話番号が英数混合の場合は登録できないこと' do
        @buy_address.phone_number = '0901234567a'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone number Input only number')
      end

      it 'item_idが空では登録できないこと' do
        @buy_address.item_id = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では登録できないこと' do
        @buy_address.user_id = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
