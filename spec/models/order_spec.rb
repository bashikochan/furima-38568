require 'rails_helper'

RSpec.describe Order, type: :model do
  
  describe '購入登録' do
    context '購入登録できるとき' do
      it '全ての項目が正しく入力されているとき' do
        expect(@user).to be_valid
      end
  end
end
