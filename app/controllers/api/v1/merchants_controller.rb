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
      render json: merchant, adapter: :json, status: 201
    else
      render json: { error: merchant.errors }, status: 422
    end
  end

  def update
    merchant = Merchant.find(params[:id])
    if Merchant.update(merchant_params)
      render json: merchant, adapter: :json, status: 201
    else
      render json: { error: merchant.errors }, status: 422
    end
  end

  def destroy
    if Merchant.find(params[:id])
      render json: Merchant.delete(params[:id])
    else
      render json: { error: "This merchant doesn't exist" }, status: 404
    end
  end

  private

  def merchant_params
    params.require(:merchant).permit(:name)
  end
end
