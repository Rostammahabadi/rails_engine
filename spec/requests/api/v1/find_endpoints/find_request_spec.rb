require 'rails_helper'

describe "User can find a resource" do
  it "returns the json for the attributes" do

    get "/api/v1/merchant/find?name=dog"

    binding.pry
  end
end
