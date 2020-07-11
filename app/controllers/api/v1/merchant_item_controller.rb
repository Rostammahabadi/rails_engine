class Api::V1::MerchantItemController < ApplicationController
  def show
    render json: Item.find(params[:id]).merchant
  end

end
