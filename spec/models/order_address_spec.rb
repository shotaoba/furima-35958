require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item_id)
    end

    context '内容に問題ない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
      it 'buildingは空でも保存できる' do
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できない' do
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      end
      it 'prefectureを選択していないと保存できない' do
      end
      it 'municipalitiesが空だと保存できない' do
      end
      it 'addressが空だと保存できない' do
      end
      it 'phone_numberが空だと保存できない' do
      end
      it 'phone_numberが9桁だと保存できない' do
      end
      it 'phone_numberが12桁だと保存できない' do
      end
      it 'phone_numberがハイフンを含んでいると保存できない' do
      end
      it 'userが紐付いていないと保存できない' do
      end
      it 'itemが紐付いてないと保存できない' do
      end
    end
end
