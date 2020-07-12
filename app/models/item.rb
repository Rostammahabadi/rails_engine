class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price
  belongs_to :merchant

  def self.find_by_params(params)
    if params[:name]
      Item.where('lower(name) LIKE ?', "%#{params[:name].downcase}%")
    elsif params[:description]
      Item.wherd('lower(description) LIKE ?', "%#{params[:description].downcase}%")
    elsif params[:unit_price]
      Item.where('unit_price LIKE ?', "%#{parms[:unit_price]}%")
    elsif params[:merchant_id]

    elsif params[:created_at]

    else
end
