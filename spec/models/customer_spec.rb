require 'rails_helper'
RSpec.describe Customer,type: :model do
  describe 'ユーザーログイン' do
    context 'バリデーション' do
      it "新規登録ができる"do
        customer=Customer.new(name:"mm",email:"kk@com",password:"1111111",password_confirmation:"1111111")
        expect(customer).to be_valid
      end
      it "新規登録ができない" do
        customer=Customer.new(name:"",email:"kk@com",password:"1111111",password_confirmation:"1111111")
        customer.valid?
        expect(customer.errors[:name]).to include("can't be blank")
      end
    end
  end
end