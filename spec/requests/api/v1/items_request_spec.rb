require 'rails_helper'

describe "Items API" do
  it "sends a single item" do
    create(:item)

    get '/api/v1/items'

    expect(response).to be_successful
  end

  it "sends a list of items" do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body, symbolize_names: true)

    expect(items[:data].count).to eq(3)
  end

  it "can get one item by its id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(item[:data][:id]).to eq("#{id}")
  end

  it "can create a new item" do
    merchant = create(:merchant)
    item_params = { name: "Saw", description: "I want to play a game", unit_price: 1111, merchant_id: merchant.id }

    post "/api/v1/items", params: item_params
    item = Item.last
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(item.name).to eq(item_params[:name])
    expect(data[:data][:attributes][:name]).to eq(item_params[:name])
  end

  it "can update an existing item" do
    id = create(:item).id
    previous_name = Item.last.name
    item_params = { name: "Sledge" }

    put "/api/v1/items/#{id}", params: item_params
    item = Item.find_by(id: id)

    expect(response).to be_successful
    expect(item.name).to_not eq(previous_name)
    expect(item.name).to eq("Sledge")
    data = JSON.parse(response.body, symbolize_names: true)
    expect(data[:data][:attributes][:name]).to eq(item_params[:name])
  end

  it "can destroy an item" do
    item = create(:item)

    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item.id}"

    expect(response).to be_successful
    expect(Item.count).to eq(0)
    expect{Item.find(item.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end

  it "returns a 404 with a message when searching for an item outside of the db" do
    item = create(:item)

    get '/api/v1/items/4'

    expect(response.status).to eq(404)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq("This Item doesn't exist")
  end

  it "returns a 404 with a message when updating an existing item with incorrect params" do
    item = create(:item)
    merchant = create(:merchant)
    item_param = { dog: "This", merchant_id: merchant.id}

    post '/api/v1/items', params: { item: item_param}
  end
end
