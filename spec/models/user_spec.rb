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

    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

    it "passwordがpassword_confirmationと一致する" do
      user = FactoryBot.build(:user)
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password", "Password number and alphabet is necessary for password")
      end 

    it"password_confirmationがpasswordと一致しない" do
      user = FactoryBot.build(:user)
      @user.password_confirmation= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    it"nicknameが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.nickname= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

    it"family_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.family_name= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

    it"family_name_readが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.family_name_read= ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name read can't be blank")
      end

    it"given_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.given_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name can't be blank", "Given name full_width only for given_name and given_name")
      end

    it"given_name_readが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.given_name_read = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name read can't be blank", "Given name read can't be blank", "Given name read full_width only for given_name and given_name")
      end

    it"date_of_birthが空では登録できない" do
      user = FactoryBot.build(:user)
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

  end

end

end