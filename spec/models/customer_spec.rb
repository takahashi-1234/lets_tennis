require 'rails_helper'
RSpec.describe '顧客モデルのテスト',type: :model do
  describe 'ログインテスト' do
    subject{customer.valid?}
    let(:customer){build(:customer)}
    
    context 'nameのカラム' do
      it "空欄でないこと" do
        customer.name= ""
        is_expected.to eq false
      end
      it "20文字以下であること" do
        is_expected.to eq true
      end
      it "20文字以上の場合" do
        customer.name= Faker::Lorem.characters(number: 25)
        is_expected.to eq false
      end
    end
  end
end