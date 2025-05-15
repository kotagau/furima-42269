require 'rails_helper'

RSpec.describe ItemBuy, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @item_buy = FactoryBot.build(:item_buy, user_id: user.id, item_id: item.id)
  end

  describe '商品情報と配送先情報登録' do
    context '内容に不備がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_buy).to be_valid
      end

      it 'buildingは、空でも保存できる' do
        @item_buy.building = ''
        expect(@item_buy).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'userが紐付いていないと保存できないこと' do
        @item_buy.user_id = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと登録できない' do
        @item_buy.item_id = nil
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @item_buy.post_code = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @item_buy.post_code = '1234567'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Post code only half-width. Include hyphen(-)')
      end

      it 'prefecture_idが1だと保存できないこと' do
        @item_buy.prefecture_id = '1'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'addressが空では保存できないこと' do
        @item_buy.address = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @item_buy.phone_number = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁未満では保存できない' do
        @item_buy.phone_number = '123456789'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'phone_numberが12桁以上では保存できない' do
        @item_buy.phone_number = '123456789123'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'cityが空では保存できない' do
        @item_buy.city = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("City can't be blank")
      end

      it 'phone_numberに半角数字以外の文字が含まれている場合保存できない' do
        @item_buy.phone_number = '０８０１２３４５６７８９'
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include('Phone number は10桁または11桁の半角数字で入力してください')
      end

      it 'tokenが空では保存できない' do
        @item_buy.token = ''
        @item_buy.valid?
        expect(@item_buy.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
