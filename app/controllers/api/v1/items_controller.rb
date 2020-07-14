class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all).serializable_hash
  end

  def show
    if !Item.where('id = ?', params[:id]).empty?
      render json: ItemSerializer.new(Item.find(params[:id])).serializable_hash
    else
      render json: { error: "This Item doesn't exist" }, status: 404
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: ItemSerializer.new(item), status: 201
    else
      render json: { error: item.errors }, status: 422
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item).serializable_hash, status: 201
    else
      render json: ErrorSerializer.new({ error: item.errors }), status: 422
    end
  end

  def destroy
    if Item.find(params[:id])
      item = Item.find(params[:id])
      item.destroy
      render json: ItemSerializer.new(item), status: 201
    else
      render json: { error: "This item doesn't exist"}, status: 404
    end
  end

  private

  def item_params
    params.permit(:name, :description, :unit_price, :merchant_id)
  end
end
