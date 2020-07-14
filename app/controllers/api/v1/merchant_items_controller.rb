class Api::V1::MerchantItemsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.find(params[:id]).items)
  end
end
