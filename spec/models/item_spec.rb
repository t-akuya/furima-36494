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

    it "カテゴリーに「---」が選択されている場合は出品できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態に「---」が選択されている場合は出品できない" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it "配送料の負担に「---」が選択されている場合は出品できない" do
      @item.delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery can't be blank")
    end

    it "発送元の地域に「---」が選択されている場合は出品できないい" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "発送までの日数に「---」が選択されている場合は出品できない" do
      @item.shipment_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipment days can't be blank")
    end

    it "priceが未入力では出品できない" do
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