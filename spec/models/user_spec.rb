require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

     describe 'ユーザー新規登録' do
         context '新規登録できる場合' do
           it "name、email、password、password_confirmation、nickname、family_name、family_name_given、given_name、given_name_read、dat_of_birthが存在すれば登録できる" do
            expect(@user).to be_valid
          end
     end

             context '新規登録できない場合' do
               it "nicknameが空では登録できない" do
                
               end

               it "emailが空では登録できない" do
               end

               it "passwordが空では登録できない" do
               end 

               it"password_confirmationが空では登録できない" do
               end

               it"nicknameが空では登録できない" do
               end

               it"family_nameが空では登録できない" do
               end

               it"family_name_readが空では登録できない" do
               end

               it"given_nameが空では登録できない" do
               end
 
               it"given_name_readが空では登録できない" do
               end

               it"date_of_birthが空では登録できない" do
               end

            end
end