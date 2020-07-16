require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:items)}
    it {should have_many(:invoices)}
    it {should have_many(:invoice_items).through(:invoices)}
  end

  describe 'Class Methods' do
    it 'gets the merchant by name' do
      merchant = create(:merchant)
      response = Merchant.find_by_params(name: "dog")
      expect(response.id).to eq(merchant.id)
    end
    it 'gets the merchant by created_at' do
      merchant = create(:merchant, created_at: Date.new(2012-01-01))
      response = Merchant.find_by_params(created_at: "2010")
      expect(response.id).to eq(merchant.id)
    end
  end
end
