require 'rails_helper'

describe "User can find a resource" do
  it "returns the json for the attributes" do
    merchant = create(:merchant)
    item = create(:item)
    get "/api/v1/items/find?name=dog&description=toy"

    expect(response).to be_successful
    merchant_response = JSON.parse(response.body)
    
    expect(merchant_response.count).to eq(1)
  end
end
