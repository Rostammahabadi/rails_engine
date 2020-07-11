class Api::V1::SearchController < ApplicationController
  def show
    render json: "#{params[:resource].capitalize}".find(params[:attribute] => params[:value])
  end
end
