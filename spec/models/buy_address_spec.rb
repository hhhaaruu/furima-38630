require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @buy_address.building = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は、「３桁ハイフン４桁」でなければ保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が0だと保存できないこと' do
        @buy_address.prefecture_id = '0'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存出来ないこと' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は１０桁以上１１桁以内の半角数値で無ければ保存出来ないこと' do
        @buy_address.phone_number = '090-1234-5678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone number is not a number")
      end
      it 'userと紐づいてなければ保存出来ないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemと紐づいてなければ保存出来ないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end