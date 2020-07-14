class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.find_by_params(items_params))
  end

  def index
    render json: ItemSerializer.new(Item.find_all_by_params(items_params))
  end

  private

  def items_params
    params.permit(:name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
