require 'rails_helper'

describe "Mechant associated with an item" do
  it "returns the merchant with the passed in item id" do
    merchant = create(:merchant)
    item = create(:item)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    
    expect(items["name"]).to eq(merchant.name)
  end
end
