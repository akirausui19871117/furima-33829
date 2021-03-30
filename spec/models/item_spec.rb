require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '出品ができる場合' do
      it 'すべてのデータが入力されていればできる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'nameが空では投稿できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '画像が空では投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'explanationが空では投稿できない' do
        @item.explanation = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが--では投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end

      it 'condition_idが--では投稿できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end

      it 'delivery_fee_idが--では投稿できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end

      it 'prefecture_idが--では投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end

      it 'delivery_day_idが--では投稿できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day Select")
      end

      it '価格は空では登録できないこと' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は全角文字では登録できないこと' do
        @item.price = "５００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '価格は半角英語だけでは登録できないこと' do
        @item.price = "aaaaaaaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '価格は半角英数混合では登録できないこと' do
        @item.price = "1a1a1a1a1a"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end


      it '価格は299円以下では登録できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end

      it '価格は10,000,000以上では登録できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end
end
