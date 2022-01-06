require 'rails_helper'
RSpec.describe 'コートモデルのテスト',type: :model do
  describe '登録のテスト' do
    subject{court.valid?}
    let(:customer) {create(:customer)}
    let!(:court) {build(:court,customer_id: customer.id)}
    
    context 'nameのカラム' do
      it '空欄でないこと' do
        court.name= ""
        is_expected.to eq false
      end
      it "20文字以下であること" do
        is_expected.to eq true
      end
      it '20文字以上の場合' do
        court.name= Faker::Lorem.characters(number: 25)
        is_expected.to eq false
      end
    end
  end
end