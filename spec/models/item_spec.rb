require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/test-image.png")
  end

describe '商品出品機能' do
  
  context '出品できるとき' do
    it "項目が正しく入力されているとき" do
      expect(@item).to be_valid
    end
  end

  context '出品できないとき' do
    it "imageが空では出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では出品できない" do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "nameが40文字以上では出品できない" do
      @item.name = 'a' * 41
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end

    it "textが空では出品できない" do
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "textが1000文字以上では出品できない" do
      @item.text = 'あ' * 1001
      @item.valid?
      expect(@item.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
    end

    it "categoryが未選択では出品できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "conditionが未選択では出品できない" do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "deliveryが未選択では出品できない" do
      @item.delivery_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it "Prefectureが未選択では出品できない" do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "shipment_daysが未選択では出品できない" do
      @item.shipment_days_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment days can't be blank")
    end

    it "priceが未選択では出品できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが¥300以下では出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it "priceが¥9,999,999以上では出品できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it "priceの数値が全角では出品できない" do
      @item.price = 300
      @item.valid?
      expect(@item.errors.full_messages).to include()
    end

  end 
end
end