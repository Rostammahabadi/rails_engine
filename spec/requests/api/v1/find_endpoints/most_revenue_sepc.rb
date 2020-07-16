require 'rails_helper'

describe "User can search most revenue" do
  it "returns the json for the top revenue producing merchants" do
    customer1 = create(:customer)
    customer2 = create(:customer)
    merchant1 = create(:merchant)
    merchant3 = create(:merchant)
    merchant4 = create(:merchant)
    item1 = create(:item, merchant_id: merchant1.id)
    item2 = create(:item, merchant_id: merchant1.id)
    item3 = create(:item, merchant_id: merchant1.id)
    item4 = create(:item, unit_price: 10, merchant_id: merchant1.id)
    item5 = create(:item, unit_price: 1, merchant_id: merchant3.id)
    item6 = create(:item, unit_price: 1000, merchant_id: merchant3.id)
    invoice1 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice2 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice3 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice4 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice5 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice6 = create(:invoice, customer_id: customer1.id, merchant_id: merchant1.id)
    invoice7 = create(:invoice, customer_id: customer2.id, merchant_id: merchant3.id)
    invoice8 = create(:invoice, customer_id: customer2.id, merchant_id: merchant3.id)
    invoice9 = create(:invoice, customer_id: customer2.id, merchant_id: merchant3.id)
    invoice_item1 = create(:invoice_item, item_id: item1.id, invoice_id: invoice1.id)
    invoice_item2 = create(:invoice_item, item_id: item1.id, invoice_id: invoice2.id)
    invoice_item3 = create(:invoice_item, item_id: item2.id, invoice_id: invoice3.id)
    invoice_item4 = create(:invoice_item, item_id: item2.id, invoice_id: invoice4.id)
    invoice_item5 = create(:invoice_item, item_id: item3.id, invoice_id: invoice5.id)
    invoice_item6 = create(:invoice_item, item_id: item4.id, invoice_id: invoice6.id)
    invoice_item7 = create(:invoice_item, item_id: item5.id, invoice_id: invoice7.id)
    invoice_item8 = create(:invoice_item, item_id: item5.id, invoice_id: invoice8.id)
    invoice_item9 = create(:invoice_item, item_id: item5.id, invoice_id: invoice9.id)
    invoice_item10 = create(:invoice_item, item_id: item6.id, invoice_id: invoice9.id)
    transaction1 = create(:transaction, invoice_id: invoice1.id)
    transaction2 = create(:transaction, invoice_id: invoice3.id)
    transaction3 = create(:transaction, invoice_id: invoice2.id)
    transaction4 = create(:transaction, invoice_id: invoice5.id)
    get "/api/v1/merchants/most_revenue?quantity=6"
    binding.pry
    json = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

end
