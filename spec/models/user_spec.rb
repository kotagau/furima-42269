require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'name、email、password、password_confirmation、nickname、family_name、family_name_given、given_name、given_name_read、dat_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上でないと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '半角英語のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password number and alphabet is necessary for password')
      end

      it '半角数字のみでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = 'te111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password number and alphabet is necessary for password')
      end

      it '半角英語のみでは登録できない' do
        @user.password = 'testtest'
        @user.password_confirmation = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password number and alphabet is necessary for password')
      end

      it '全角入力では登録できないこと' do
        @user.password = 'ｔｔｔｔｔｔ'
        @user.password_confirmation = 'ｔｔｔｔｔｔ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password number and alphabet is necessary for password')
      end

      it 'password_confirmationがpasswordと一致しない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameが漢字・ひらがな・カタカナ以外だと登録出来ない' do
        @user.family_name = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name full_width only for given_name and given_name')
      end

      it 'family_name_readが空では登録できない' do
        @user.family_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name read can't be blank")
      end

      it 'family_name_readが漢字・ひらがな・カタカナ以外だと登録できない' do
        @user.family_name_read = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name read full_width only for given_name and given_name')
      end

      it 'given_nameが空では登録できない' do
        @user.given_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end

      it 'given_nameがカタカナ以外だと登録できない' do
        @user.given_name = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name full_width only for given_name and given_name')
      end

      it 'given_name_readが空では登録できない' do
        @user.given_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name read can't be blank")
      end

      it 'given_name_readがカタカナ以外だと登録できない' do
        @user.given_name_read = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Given name read full_width only for given_name and given_name')
      end

      it 'date_of_birthが空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
