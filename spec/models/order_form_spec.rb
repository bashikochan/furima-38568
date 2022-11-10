require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_form = FactoryBot.build(:order_form, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入登録' do
    context '商品購入登録できるとき' do
      it '全ての項目が正しく入力されているとき' do
        expect(@order_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品購入登録できないとき' do
      it 'postcodeが空では登録できない' do
        @order_form.postcode = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Postcode can't be blank"
      end
      it 'postcodeが「3桁ハイフン4桁」の半角文字列ではないとき登録できない' do
        @order_form.postcode = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Postcode is invalid.Enter it as follows(e.g. 123-4567)'
      end
      it 'prefecture_idが未選択では登録できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空では登録できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "City can't be blank"
      end
      it 'blockが空では登録できない' do
        @order_form.block = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Block can't be blank"
      end
      it 'phoneが空では登録できない' do
        @order_form.phone = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが10桁未満では登録できない' do
        @order_form.phone = '012345678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone is too short'
      end
      it 'phoneが12桁以上では登録できない' do
        @order_form.phone = '012345678901'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone is too long'
      end
      it 'phoneが半角数値でなければ登録できない' do
        @order_form.phone = 'あああ-ああああああ'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include 'Phone is invalid.Input only number'
      end
      it 'tokenが空では登録できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが空では登録できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end