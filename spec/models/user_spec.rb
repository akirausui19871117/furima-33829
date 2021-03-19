require 'rails_helper'

# RSpec.describe User, type: :model do
  describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end


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

end
# end
