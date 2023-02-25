require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
  
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が出品できる場合' do
      it '全ての値が入力されていれば出品出来る' do
        expect(@item).to be_valid
      end
    end
   
    context '商品が出品できない場合' do
      it 'item_nameが空では保存できない' do
       @item.item_name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'item_infoが空では保存できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it 'category_idが0では保存できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category Can't be blanck"
      end
      it 'sales_status_idが0では保存できない' do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Sales status Can't be blanck"
      end
      it 'shipping_fee_status_idが0では保存できない' do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping fee status Can't be blanck"
      end
      it 'prefecture_idが0では保存できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture Can't be blanck"
      end
      it 'scheduled_delivery_idが0では保存できない' do
      @item.scheduled_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Scheduled delivery Can't be blanck"
      end
      it 'userが紐付いていなければ保存出来ない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "User must exist"
      end
      it 'item_priceが空では保存出来ない' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Item price can't be blank"
      end
      it 'item_priceが全角数字では保存出来ない' do
      @item.item_price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include "Item price is not a number"
      end

      it 'item_priceが300未満では保存出来ない' do
      @item.item_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Item price must be greater than or equal to 300"
      end

      it 'item_priceが10000000以上では保存出来ない' do
      @item.item_price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Item price must be less than or equal to 9999999"
      end
      it 'item.imageが空では保存出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to  include "Image can't be blank"
      end
    end
  end
end