require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end
    
      context '商品購入がうまくいくとき' do
        it 'postal_code, prefecture_id, city, block, building, phone_number, item_id, user_id, tokenがあれば購入できる' do
          expect(@order_form).to be_valid
        end

        it '建物名が空でも購入できる' do
          @order_form.building = ''
          expect(@order_form).to be_valid
        end

      end
  
      context '商品購入がうまくいかないとき' do
  
        it 'postal_codeが空では登録できないこと' do
          @order_form.postal_code = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
        end

        it "郵便番号にはハイフンが必要であること" do
          @order_form.postal_code = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal code is invalid")
        end
  
        it 'prefecture_idが0では登録できないこと' do
          @order_form.prefecture_id = 0
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include('Prefecture must be other than 0')
        end
  
        it 'cityが空では登録できないこと' do
          @order_form.city = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end
  
        it 'blockが空では登録できないこと' do
          @order_form.block = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Block can't be blank")
        end

        it 'phone_numberが空では登録できないこと' do
          @order_form.phone_number = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
        end

        it "電話番号にはハイフンは不要あること" do
          @order_form.phone_number = "000-000-000000"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it "電話番号は11桁以内であること" do
          @order_form.phone_number = "000000000000"
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it 'item_idが空では登録できないこと' do
          @order_form.item_id = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Item can't be blank")
        end

        it 'user_idが空では登録できないこと' do
          @order_form.user_id = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("User can't be blank")
        end

        it "tokenが空では登録できないこと" do
          @order_form.token = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Token can't be blank")
        end

      end 
  end
end