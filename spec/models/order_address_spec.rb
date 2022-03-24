require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end


  describe '商品購入機能' do

    context '購入できるとき' do
      it '項目が正しく入力されているとき' do
        expect(@order_address).to be_valid
      end
    end

    context '購入できないとき' do
      it "postal_codeが空では購入できない" do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeは「3桁ハイフン4桁」の半角文字列でないと保存できない" do
        @order_address.postal_code = '123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end

      it "prefecture_idに「---」が選択されている場合は購入できない"do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空では購入できない" do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "house_numberが空では購入できない" do
        @order_address.house_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it "phone_numberが空では購入できない" do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは、10桁以上11桁以内の半角数値でないと保存できない" do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空では購入できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

    
    
    
    end
  end
end
