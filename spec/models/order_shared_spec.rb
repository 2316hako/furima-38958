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

      it 'post_codeが3桁ハイフン4桁でないと購入できない' do
        @order_shared.post_code = '1230092'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Post code is invalid")
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

      it 'addressが空では購入できない' do
        @order_shared.address = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空では購入できない' do
        @order_shared.telephone_number = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが9桁以下では購入できない' do
        @order_shared.telephone_number = '123456789'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberが12桁以上では購入できない' do
        @order_shared.telephone_number = '123456789012'
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Telephone number is invalid")
      end

      it "tokenが空では登録できないこと" do
        @order_shared.token = nil
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが紐付いていないと購入できないこと' do
        @order_shared.user_id = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと購入できない' do
        @order_shared.item_id = ''
        @order_shared.valid?
        expect(@order_shared.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end