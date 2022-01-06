require 'rails_helper'
RSpec.describe 'イベントモデルのテスト',type: :model do
  describe '登録のテスト' do
    subject{event.valid?}
    let(:customer) {create(:customer)}
    let(:court) {create(:court,customer_id: customer.id)}
    let(:circle) {create(:circle,customer_id: customer.id,court_id: court.id)}
    let!(:event) {build(:event,circle_id: circle.id)}
    
    context 'titleのカラム' do
      it '空欄でないこと' do
        event.title=""
        is_expected.to eq false
      end
      it '20字以上の場合' do
        event.title= Faker::Lorem.characters(number: 25)
        is_expected.to eq false
      end
    end
    context 'bodyのカラム' do
      it '空欄でないこと' do
        event.body=""
        is_expected.to eq false
      end
      it '20字以上の場合' do
        event.body= Faker::Lorem.characters(number: 101)
        is_expected.to eq false
      end
    end
    context 'event_dateカラム' do
      it '空欄でないこと' do
        event.event_date=""
        is_expected.to eq false
      end
    end
    context 'event_deadlineカラム' do
      it '空欄でないこと' do
        event.event_deadline=""
        is_expected.to eq false
      end
    end
  end
end