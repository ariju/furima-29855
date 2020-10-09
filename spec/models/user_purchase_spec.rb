require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#create' do
    before do
      @user1 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @user_purchase = FactoryBot.build(:user_purchase, user_id: @user1.id, item_id: @item.id)
    end

    it 'tokenがあれば保存ができること' do
      expect(@user_purchase).to be_valid
    end

    it 'tokenが空だと保存できないこと' do
      @user_purchase.token = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空だと保存できないこと' do
      @user_purchase.post_code = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Post code Input correctly')
    end

    it 'municipalityが空だと保存できないこと' do
      @user_purchase.municipality = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Municipality can't be blank")
    end

    it 'addressが空だと保存できないこと' do
      @user_purchase.address = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @user_purchase.phone_number = nil
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it '都道府県の情報が必須である事' do
      @user_purchase.shipping_area_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Shipping area Select')
    end

    it '郵便番号にはハイフンが必須である事' do
      @user_purchase.post_code = '1234567'
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include('Post code Input correctly')
    end

    it '電話番号にはハイフンは不要で、11桁以内であること' do
      @user_purchase.phone_number = '1234-56789012'
      @user_purchase.valid?
      expect(@user_purchase).to be_valid
    end
  end
end
# 正常系の場合は間違いを入れること
