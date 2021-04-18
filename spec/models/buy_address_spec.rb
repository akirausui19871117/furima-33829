require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end
  
    describe '商品購入機能' do
      context '出品ができる場合' do
        it 'すべてのデータが入力されていればできる' do
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
          expect(@buy_address.errors.full_messages).to include("Postal code Input correctly")
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
          expect(@buy_address.errors.full_messages).to include("Phone number Input only number")
        end
      end
    end
  end

