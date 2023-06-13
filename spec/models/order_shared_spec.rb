require 'rails_helper'

RSpec.describe OrderShared, type: :model do
  before do
    @order_shared = FactoryBot.build(:order_shared)
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shared = FactoryBot.build(:order_shared, user_id: user.id, item_id: item.id)
  end

  describe '購入情報入力' do
    context '商品購入できるとき' do
      it '全ての値が正しく入力されていれば商品購入ができること' do
        expect(@order_shared).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'post_codeが空では購入できない' do
        @order_shared.post_code = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Post code can't be blank")
      end

      it 'prefecture_idが空では購入できない' do
        @order_shared.prefecture_id = 1
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @order_shared.city = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("City can't be blank")
      end
    end
  end
end