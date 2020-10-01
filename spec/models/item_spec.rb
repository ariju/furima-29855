require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'userがいれば保存される' do
      expect(@item).to be_valid
    end

    it '画像は1枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.product_name_description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name description can't be blank")
    end

    it ' カテゴリーの情報が必須であること' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it ' 商品の状態についての情報が必須であること' do
      @item.product_condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Product condition Select')
    end

    it '  配送料の負担についての情報が必須であること' do
      @item.burden_of_shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Burden of shipping charges Select')
    end

    it '  発送元の地域についての情報が必須であること    ' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area Select')
    end

    it '  発送までの日数についての情報が必須であること    ' do
      @item.days_to_ship_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship Select')
    end

    it '  価格についての情報が必須であること ' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number', 'Price Half-width number')
    end

    it '  価格の範囲が、300以下では出品できない ' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '¥9,999,999より大きい数字が入力された場合保存できない' do
      @item.price = 10, 0o00, 0o00, 0o00
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '  販売価格は半角数字のみ保存可能であること' do
      @item.price = '１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
