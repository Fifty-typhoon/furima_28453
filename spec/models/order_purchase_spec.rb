require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  before do
    @order_purchase = FactoryBot.build(:order_purchase)
  end

  describe '購入できるとき' do
    it 'token,post_number,prefecture_id,city,address,phone_numberがあるとき購入できる' do
      expect(@order_purchase).to be_valid
    end
    it 'post_numberにハイフン(-)があるとき購入できる' do
      @order_purchase.post_number = '123-4567'
      expect(@order_purchase).to be_valid
    end
    it 'phone_numberにハイフン(-)がないとき購入できる' do
      @order_purchase.phone_number = '12345678910'
    end
  end

  describe '購入できないとき' do
    it 'tokenがなければ登録できない' do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_numberが空だと購入できない' do
      @order_purchase.post_number = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post number can't be blank")
    end
    it 'post_numberにハイフン(-)がないと購入できない' do
      @order_purchase.post_number = '1234567'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空だと購入できない' do
      @order_purchase.prefecture_id = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "prefecture_idが{ id: 1, name: '---' }だと購入できない" do
      @order_purchase.prefecture_id = 1
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Prefecture must be other than 1')
    end
    it 'cityが空だと購入できない' do
      @order_purchase.city = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空だと購入できない' do
      @order_purchase.address = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @order_purchase.phone_number = ''
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberにハイフン(-)があると購入できない' do
      @order_purchase.phone_number = '123-4567-8910'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number is invalid. Not include hyphen(-)')
    end
    it 'phone_numberが12桁以上だと購入できない' do
      @order_purchase.phone_number = '012345678912'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Phone number is invalid. Not include hyphen(-)')
    end
  end
end
