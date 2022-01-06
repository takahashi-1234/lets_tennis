require 'rails_helper'
RSpec.describe 'サークルのテスト',type: :model do
  describe '登録のテスト' do
    subject{circle.valid?}
    let(:customer) {create(:customer)}
    let(:court) {create(:court,customer_id: customer.id)}
    let!(:circle) {build(:circle,customer_id: customer.id,court_id: court.id)}

    context 'circle_nameのカラム' do
      it '空欄でないこと' do
        circle.circle_name= ""
        is_expected.to eq false
      end
      it '20字以下であること' do
        is_expected.to eq true
      end
      it '20字以上の場合' do
        circle.circle_name= Faker::Lorem.characters(number: 25)
        is_expected.to eq false
      end
    end
    context 'bodyのカラム' do
      it '空欄でないこと' do
        circle.body= ""
        is_expected.to eq false
      end
      it '200字以下であること' do
        is_expected.to eq true
      end
      it '200字以上の場合' do
        circle.body= Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
    context 'leader_nameのカラム' do
      it '空欄でないこと' do
        circle.leader_name=""
        is_expected.to eq false
      end
      it '20字以下であること' do
        is_expected.to eq true
      end
      it '20字以上の場合' do
        circle.leader_name=Faker::Lorem.characters(number: 21)
        is_expected.to eq false
      end
    end
  end
end