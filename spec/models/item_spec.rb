require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

    describe '新規出品' do
    context '新規出品できる場合' do
      it "image , product_name , product_explanation , product_category_id , product_status_id , deliver_fee_payment_id , prefecture_id , deliver_day_id , price が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

context '新規登録できない場合' do

    it "imageが空では登録できない" do  
      @item.image = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'product_nameは空では登録できない' do
       @item.product_name= ''
       @item.valid?
      expect(@item.errors.full_messages).to include('product_name cannot be blank')
    end

    it 'product_explanationは空では登録できない' do
      @item.product_explanation=''
      @item.valid?
      expect(@item.errors.full_messages).to include('product_explanation cannot be blank')
    end

    it "product_explanationが1000字以上では登録できない" do
      @item.product_explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("product_explanation is too long(maximun 1000 characters)")
    end 

    it 'product_category_idが空では登録できない' do
      @item.product_category = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('product_category_id cannot be blank')
    end

    it 'product_category_idが1では登録できない' do
      @item.product_category_id = '1'
      @item.valid?
      expect(@items.errors.full_messages).to include('product_category_id 1 is not available')
    end

    it 'product_status_idが空では登録できない' do
      @item.product_status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include('product_status_id cannot be blank')
    end

    it 'product_status_idが1では登録できない' do
      @item.product_status_id='1'
      @item.valid?
      expect(@item.errors.full_messages).to include('product_status_id 1 is not available')
    end

    it 'deliver_fee_payment_idが空では登録できない' do
      @item.deliver_fee_payment_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include('deliver_fee_payment_id cannot be blank')
    end

    it"deliver_fee_payment_idが1では登録できない" do
      @item.deliver_fee_payment_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("deliver_fee_payment_id 1 is not available")
    end

    it"prefecture_id が空では保存できない" do
      @item.prefecture_id= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("prefecture_id can't be blank")
    end

    it"prefecture_idが1では登録できない" do
      @item.prefecture_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("prefecture_id 1 is not available")
    end

    it"deliver_day_idが空では登録できない" do
      @item.deliver_day_id=''
      @item.valid?
      expect(@item.errors.full_messages).to include("deliver_day_id cannot be blank")
      end

    it"deliver_day_idが1では登録できない" do
      @item.deliver_day_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end

    it"priceが空では登録できない" do
    @item.price= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("price cannot be blank")
    end

    it"priceが300未満では登録できない" do
    @item.price='299'
    @item.valid?
    expect(@item.errors.full_messages).to include("price is too small(minimum is 300)")
    end

  it"priceが10000000以上では登録できない" do
  @item.given_name = '1000000000'
  @item.valid?
  expect(@item.errors.full_messages).to include("price is too big(maximum is 999999)")
  end












































end
