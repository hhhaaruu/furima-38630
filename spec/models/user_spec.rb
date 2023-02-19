require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@が含まれていないと保存できないこと' do
        @user.email = 'haruki51'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it '重複したemailは保存出来ないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが半角英字のみだと保存できないこと' do
        @user.password = 'haruki'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password eisuuzikonngou"
      end
      it 'passwordが半角数字のみだと保存できないこと' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password eisuuzikonngou"
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'ththth５４'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password eisuuzikonngou"
      end
      it 'passwordとpassword_confirmationが不一致だと保存出来ない' do
        @user.password = 'haruki551'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが5文字以下だと保存出来ない' do
        @user.password = 'har51'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it '姓（全角）が空だと保存出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '姓（全角）に半角が含まれていると保存出来ない' do
        @user.last_name = 'nakayama'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid. Input full-width characters."
      end
      it '名前（全角）が空だと保存出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '名前（全角）に半角が含まれていると保存出来ない' do
        @user.first_name = 'haruki'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid. Input full-width characters."
      end

      it '姓（カナ）が空だと保存出来ない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it '姓（カナ）にカナ以外の文字が含まれていると保存出来ない' do
        @user.last_name_kana = 'nakayama'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid. Input full-width katakana characters."
      end
      it '名前（カナ）が空だと保存出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '名前（カナ）にカナ以外の文字が含まれていると保存出来ない' do
        @user.first_name_kana = 'haruki'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid. Input full-width katakana characters."
      end
      
      it '生年月日が空だと保存出来ない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
    end
  end
end


