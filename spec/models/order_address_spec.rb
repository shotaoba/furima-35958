require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報の保存' do
    context '内容に問題がない場合' do
      it '必要な項目が全て入力されていれば、登録ができる' do
        @order_address.valid?
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも他が全て入力されていれば、登録できる' do
        @order_address.building = ''
        @order_address.valid?
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank",
                                                               'Postal code is invalid. Include hyphen(-)')
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureが空だと保存できない' do
        @order_address.prefecture = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが1だと保存できない' do
        @order_address.prefecture = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank",
                                                               'Phone number is invalid. Enter your phone number')
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @order_address.phone_number = '123-4567-8910'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Enter your phone number')
      end
      it 'phone_numberが12桁以上あると保存できない' do
        @order_address.phone_number = 1234567891011
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Enter your phone number')
      end
      it 'phone_numberが全角だと保存できない' do
        @order_address.phone_number = '１２３４５６７８９１０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Enter your phone number')
      end
      it 'phone_numberが半角英数字混合であると保存できない' do
        @order_address.phone_number = '12345678aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid. Enter your phone number')
      end
      it 'userが紐ついてないと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐ついてないと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがないと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
