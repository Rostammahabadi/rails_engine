class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all).serializable_hash
  end

  def show
    if Merchant.find(params[:id])
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    else
      render json: { error: "This merchant doesn't exist" }, status: 404
    end
  end

  def create
    merchant = Merchant.new(merchant_params)
    if merchant.save
      render json: MerchantSerializer.new(merchant), adapter: :json, status: 201
    else
      render json: { error: merchant.errors }, status: 422
    end
  end

  def update
    merchant = Merchant.find(params[:id])
    if merchant.update(merchant_params)
      render json: MerchantSerializer.new(merchant), status: 201
    else
      render json: { error: merchant.errors }, status: 422
    end
  end

  def destroy
    if Merchant.find(params[:id])
      merchant = Merchant.find(params[:id])
      merchant.destroy
      render json: MerchantSerializer.new(merchant), status: 201
    else
      render json: { error: "This merchant doesn't exist" }, status: 404
    end
  end

  private

  def merchant_params
    params.permit(:name)
  end
end
