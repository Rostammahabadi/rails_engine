class Merchant < ApplicationRecord
  validates_presence_of :name
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices

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

  def self.most_revenue(params)
    select('merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) AS total_revenue').
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: 'success'}).
    group('merchants.id').order('total_revenue DESC').
    limit("#{params[:quantity].to_i}")
  end

  def self.most_items(params)
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: 'success'}).
    group('merchants.id').
    order('sum(invoice_items.quantity) DESC').
    limit("#{params.to_i}")
  end

  def self.revenue_between_dates(params)
    select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').
    joins(invoices: [:transactions, :invoice_items]).
    where(transactions: {result: 'success'}).
    where("to_char(invoices.updated_at, 'YYYY-MM-DD') BETWEEN '#{params[:start]}' AND '#{params[:end]}'")
  end

  def self.merchant_revenue
    sql_injection = "SELECT  max(m_revenue) as revenue FROM (SELECT merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as m_revenue FROM merchants INNER JOIN invoices on merchants.id = invoices.merchant_id INNER JOIN invoice_items ON invoices.id = invoice_items.invoice_id INNER JOIN transactions ON invoices.id = transactions.invoice_id WHERE transactions.result = 'success' GROUP BY merchants.id) AS revenue"
    find_by_sql(sql_injection)
    # select('max(revenue)').from(select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').joins(invoices: [:transactions, :invoice_items]).where(transactions: {result: 'success'}))
  end
end
