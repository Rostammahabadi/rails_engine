class Api::V1::RevenueController < ApplicationController
  def index
    # unable to call .first on return relation from class method due to error regarding group_by needing merchant.id
    render json: RevenueSerializer.new(Merchant.revenue_between_dates(date_params).to_a.first)
  end

  private

  def date_params
    params.permit(:start, :end)
  end
end
