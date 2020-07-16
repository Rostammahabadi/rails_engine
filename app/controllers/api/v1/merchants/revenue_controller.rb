class Api::V1::Merchants::RevenueController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.most_revenue(revenue_params))
  end

  def show
    render json: MerchantSerializer.new(Merchant.merchant_revenue)
  end

  private

  def revenue_params
    params.permit(:quantity)
  end
end
