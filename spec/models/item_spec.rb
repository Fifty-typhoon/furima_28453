require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    # user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it "image、name、detail、category_id、state_id、delivery_fee_id、ship_from_location_id、delivery_date_id、priceがあれば出品できる" do
        expect(@item).to be_valid
      end
      it "priceが300~9999999なら出品できる" do
        @item.price = 300 && @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailが空だと出品できない" do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "category_idが空だと出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが{ id: 1, name: '---' }だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "state_idが空だと出品できない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "state_idが{ id: 1, name: '---' }だと出品できない" do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it "delivery_fee_idが空だと出品できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_fee_idが{ id: 1, name: '---' }だと出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "ship_from_location_idが空だと出品できない" do
        @item.ship_from_location_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from location can't be blank")
      end
      it "ship_from_location_idが{ id: 1, prefecture: '---' }だと出品できない" do
        @item.ship_from_location_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from location must be other than 1")
      end
      it "delivery_date_idが空だと出品できない" do
        @item.delivery_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "delivery_date_idが{ id: 1, name: '---' }だと出品できない" do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満だと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9999999より大きいと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
