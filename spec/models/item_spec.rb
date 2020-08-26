require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @Item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it "image、name、detail、category_id、state_id、delivery_fee_id、ship_from_location_id、delivery_date_id、priceがあれば出品できる" do
        #expect(@user.valid?).to eq true
      end
      it "priceが300~9,999,999なら出品できる" do
      end
    end

    context '商品が出品できないとき' do
      it "imageが空だと出品できない" do
        @item.image = ""
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
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      it "state_idが空だと出品できない" do
        @item.state_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("State_id can't be blank")
      end
      it "delivery_fee_idが空だと出品できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery_fee_id can't be blank")
      end
      it "ship_from_location_idが空だと出品できない" do
        @item.ship_from_location_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship_from_location_id cant' be blank")
      end
      it "が空だと出品できない" do
        @item.delivery_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery_date_id can't be blank")
      end
      it "priceが空だと出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
