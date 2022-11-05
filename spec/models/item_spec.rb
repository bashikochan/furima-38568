require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
    context '商品登録できるとき' do
      it '全ての項目が正しく入力されているとき' do
        expect(@item).to be_valid
      end
      it 'item_nameが空でなければ登録できる' do
        @item.item_name = 'マウンテンバイク'
        expect(@item).to be_valid
      end
      it 'descriptionが空でなければ登録できる' do
        @item.description = 'デザインが可愛くて購入しましたがサイズが合いませんでした'
        expect(@item).to be_valid
      end
      it 'category_idが空でなければ登録できる' do
        @item.category_id = '2'
        expect(@item).to be_valid
      end
      it 'condition_idが空でなければ登録できる' do
        @item.condition_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_fee_idが空でなければ登録できる' do
        @item.shipping_fee_id = '2'
        expect(@item).to be_valid
      end
      it 'prefectures_idが空でなければ登録できる' do
        @item.prefectures_id = '2'
        expect(@item).to be_valid
      end
      it 'shipping_date_idが空でなければ登録できる' do
        @item.shipping_date_id= '2'
        expect(@item).to be_valid
      end
      it 'priceが空でなければ登録できる' do
        @item.price = 120000
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageがnilでは登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'category_idが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'condition_idが未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it 'shipping_fee_idが未選択では登録できない' do
        @item.shipping_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'prefectures_idが未選択では登録できない' do
        @item.prefectures_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefectures can't be blank"
      end
      it ' shipping_date_idが未選択では登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping date can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceに全角文字を含むと登録できない' do
        @item.price = 'ああああああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.Input half-width characters')
      end
      it 'priceが¥300より少ないと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが¥9,999,999より多いと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end