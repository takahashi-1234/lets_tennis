require 'rails_helper'
RSpec.describe 'コートモデルのテスト',type: :model do
  describe '登録のテスト' do
    subject{court.valid?}
    let(:court){build(:court)}
    
    context 'nameのカラム' do
      it '空欄でないこと' do
        court.name=""
        is_expected.to eq false
      end
      it "20文字以下であること" do
        court.name="高輪テニスコート"
        is_expected.to eq true
      end
      it '20文字以上の場合' do
        is_expected.to eq false
      end
    end
  end
end