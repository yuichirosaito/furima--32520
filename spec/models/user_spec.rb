require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, last_name, first_name, first_name_kana, last_name_kana, email、birthday, passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do

     it "nicknameが空では登録できないこと" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end

     it "last_nameが空では登録できないこと" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end

     it "first_nameが空では登録できないこと" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end

     it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it "last_nameが全角日本語でないと保存できないこと" do
      @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
     end  

     it "first_nameが全角日本語でないと保存できないこと" do
      @user.first_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
     end  

     it "last_name_kanaが全角（カタカナ）でないと保存できないこと" do
      @user.last_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
     end 

     it "first_name_kanaが全角（カタカナ）でないと保存できないこと" do
      @user.first_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
     end

     it "emailが空では登録できないこと" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end

     it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

     it "emailに@が含まれていないと登録できない" do
      @user.email = "l.0821.enjoyicloud.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end

     it "birthdayが空では登録できないこと" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end

     it "passwordが空では登録できないこと" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end  

      it "パスワードは、半角英数字混合での入力が必須であること" do
        @user.password = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "パスワードは、半角英数字混合での入力が必須であること" do
       @user.password = "aaaaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "パスワードは、6文字以上の入力が必須であること" do
        @user.password = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
     end

     it "パスワードは、確認を含め2回の入力が必須であること" do
       @user.password_confirmation = "1234test"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
 end
end