class Item < ApplicationRecord
  validates :name, presence: true, on: :create
  validates :description, presence: true, on: :create
  validates :unit_price, presence: true, on: :create
  belongs_to :merchant

  def self.find_by_params(params)
    if params[:name]
      Item.where('lower(name) LIKE ?', "%#{params[:name].downcase}%").first
    elsif params[:description]
      Item.where('lower(description) LIKE ?', "%#{params[:description].downcase}%").first
    elsif params[:created_at]
      Item.where(created_at: "%#{params[:created_at]}%").first
    else
      Item.where(updated_at: "%#{params[:updated_at]}%").first
    end
  end

  # def self.find_all_by_params(params)
  #   params.to_h.each do |key,value|
  #     if key == 'name' || key == 'description'
  #       Item.where("lower(#{key.downcase}) LIKE ?" ,"%#{value.downcase}%")
  #     elsif key == 'created_at' || key == 'updated_at'
  #       Item.where("#{key} = #{value}")
  #     else
  #       Item.where(merchant_id: value)
  #     end
  #   end
  # end
  def self.find_all_by_params(params)
    if params[:name]
      Item.where('lower(name) LIKE ?', "%#{params[:name]}%")
    elsif params[:description]
      Item.where('lower(description) LIKE ?', "%#{params[:description]}%")
    elsif params[:created_at]
      Item.where(created_at: "%#{params[:created_at]}%")
    else
      Item.where(updated_at: "%#{params[:updated_at]}%")
    end
  end
end
