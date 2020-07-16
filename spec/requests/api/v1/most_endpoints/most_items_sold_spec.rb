require 'rails_helper'

describe "It can get most items sold" do
  it "returns the most items for a quantity" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    merchant1 =create(:merchant)
    merchant2 =create(:merchant)
    merchant3 =create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    item3 = create(:item, merchant_id: merchant1.id)
    item4 = create(:item, merchant_id: merchant1.id)
    item5 = create(:item, merchant_id: merchant1.id)
    item6 = create(:item, merchant_id: merchant2.id)
    item7 = create(:item, merchant_id: merchant2.id)
    item8 = create(:item, merchant_id: merchant3.id)
    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice2 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice4 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice5 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice6 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice7 = create(:invoice, customer_id: customer2.id, merchant_id: merchant2.id)
    invoice8 = create(:invoice, customer_id: customer2.id, merchant_id: merchant3.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice3.id)
    transaction3 = create(:transaction, invoice_id: invoice8.id)
    transaction4 = create(:transaction, invoice_id: invoice7.id)
    get '/api/v1/merchants/most_items?quantity=2'

    json = JSON.parse(response.body, symbolize_names: true)
    merchant_array = [merchant1, merchant2]
    merchant_array.each do |merchant|
      json[:data].each do |d|
        expect(d[:id]).to eq("#{merchant.id}")
        expect(d[:attributes][:name]).to eq(merchant.name)
      end
    end
  end
end
