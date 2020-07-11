require 'rails_helper'

describe "items associated with a merchant" do
  it "returns a list of items associated with the merchant id" do
    merchant1 = create(:merchant)
    merchant2 = create(:merchant)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant1.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)
    create(:item, merchant_id: merchant2.id)

    get "/api/v1/merchants/#{merchant1.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(4)
  end
end
