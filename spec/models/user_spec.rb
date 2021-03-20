require 'rails_helper'


  describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end


    describe 'ユーザー新規登録' do
      context'ユーザー新規登録できるとき' do

        it 'すべての入力がなされていれば登録できる' do
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
          @user.password = 'aaa000'
          @user.password_confirmation = 'aaa000'
          expect(@user).to be_valid
        end
        it 'family_nameとfirst_nameが漢字・平仮名・カタカナなら登録ができる' do
          @user.family_name = '振り間'
          @user.first_name = '亜府利'
          expect(@user).to be_valid
        end
        it 'family_name_kanaとfirst_name_kanaが全角カタカナなら登録ができる' do
          @user.family_name_kana = 'フリマ'
          @user.first_name_kana = 'アプリ'
          expect(@user).to be_valid
        end
      end

      context'ユーザー新規登録できないとき' do
        it "emailが空だと登録できない" do
          @user.email = " " 
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailが一意でないと登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "emailに＠が含まれていないと登録できない" do
          @user.email = "test.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
      
        it "passwordが６文字以上でないと登録できない" do
          @user.password = "1111a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordが空だと登録できない" do
          @user.password = " "
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "passwordが６文字以上でないと登録できない" do
          @user.password = "1111a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it "passwordとpassword_confirmationが同じでないと登録できない" do
          @user.password = "11111a"
          @user.password_confirmation = "22222a"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "Passwordは半角英語のみでは登録できないこと" do
          @user.password = "aaaaaaa"
          @user.password_confirmation = "aaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it "Passwordは数字のみでは登録できないこと" do
          @user.password = "1111111"
          @user.password_confirmation = "1111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it "Passwordは全角英数混合では登録できないこと" do
          @user.password = "あんあんあん"
          @user.password_confirmation = "あんあんあん"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end

        it "family_nameが空では登録できないこと" do
          @user.family_name = " "
          @user.valid?
          expect(@user.errors.full_messages).to include( "Family name can't be blank" )
        end

        it "first_nameが空では登録できないこと" do
          @user.first_name = " "
          @user.valid?
          expect(@user.errors.full_messages).to include( "First name can't be blank" )
        end

        it "family_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
          @user.first_name = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include( "First name Full-width characters" )
        end
        it "first_nameが漢字・平仮名・カタカナ以外では登録できないこと" do
          @user.first_name = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include( "First name Full-width characters" )
        end

        it "family_name_kanaが空では登録できないこと" do
          @user.family_name_kana = " "
          @user.valid?
          expect(@user.errors.full_messages).to include( "Family name kana can't be blank" )
        end

        it "first_name_kanaが空では登録できないこと" do
          @user.first_name_kana = " "
          @user.valid?
          expect(@user.errors.full_messages).to include( "First name kana can't be blank" )
        end
        it "family_name_kanaが全角カタカナ以外では登録できないこと" do
          @user.family_name_kana = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include( "Family name kana Full-width katakana characters" )
        end
        it "first_name_kanaが全角カタカナ以外では登録できないこと" do
          @user.first_name_kana = "aaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include( "First name kana Full-width katakana characters" )
        end
      end
    end
end
