class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items

  def self.find_by_params(params)
    if params[:name]
      Merchant.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").first
    elsif params[:created_at]
      Merchant.where('created_at LIKE ?', "%#{params[:created_at]}%").first
    elsif params[:updated_at]
      Merchant.where('updated_at LIKE ?', "%#{params[:updated_at]}%").first
    end
  end

  def self.find_all_by_params(params)
    if params[:name]
      Merchant.where('lower(name) LIKE ?', "%#{params[:name].downcase}%")
    elsif params[:created_at]
      Merchant.where('created_at LIKE ?', "%#{params[:created_at]}%")
    elsif params[:updated_at]
      Merchant.where('updated_at LIKE ?', "%#{params[:updated_at]}%")
    end
  end
end
