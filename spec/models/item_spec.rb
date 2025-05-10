require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item= FactoryBot.build(:item)
  end

describe '新規出品' do
      context '新規出品できる場合' do
        it "image,user,product_name,product_explanation,product_category_id,product_status_id,deliver_fee_payment_id,prefecture_id,deliver_day_id,priceが存在すれば登録できる" do
          expect(@item).to be_valid
        end
      end

context '新規登録できない場合' do

    it "userが空では登録できない" do
      @item.user=nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User can't be blank")
    end



    it 'product_nameは空では登録できない' do
       @item.product_name= ''
       @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end



    it 'product_nameは40字以上では登録できない'do
        @item.product_name ="a"*41
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name is too long (maximum is 40 characters)")
   end



    it 'product_explanationは空では登録できない' do
      @item.product_explanation=''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product explanation can't be blank")
    end




    it "product_explanationが1000字以上では登録できない" do
     @item.product_explanation = "あいうえお" * 201
     @item.valid?
     expect(@item.errors.full_messages).to include("Product explanation is too long (maximum is 1000 characters)")
    end

    it 'product_category_idが1では登録できない' do
      @item.product_category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product category must be other than 1")
    end



    it 'product_status_idが1では登録できない' do
      @item.product_status_id='1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end


    it"deliver_fee_payment_idが1では登録できない" do
      @item.deliver_fee_payment_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliver fee payment must be other than 1")
    end



    it"prefecture_idが1では登録できない" do
      @item.prefecture_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end


    it"deliver_day_idが1では登録できない" do
      @item.deliver_day_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Deliver day must be other than 1")
    end


    it"priceが空では登録できない" do
    @item.price= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
    end


    it"priceが300未満では登録できない" do
    @item.price='299'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end


   it"priceが10000000以上では登録できない" do
   @item.price = '1000000000'
   @item.valid?
   expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
   end

   it"priceが全角数字では保存できない" do
    @item.price="１００００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
   end



  end
end
end
