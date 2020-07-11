desc "it creates all invoices"
task :create_invoices do
  require 'csv'
  CSV.foreach("db/invoices.csv", headers: true) do |row|
  Invoice.create(
    customer_id: row[1],
    merchant_id: row[2],
    status: row[3],
    created_at: row[4],
    updated_at: row[5]
  )
  end
end
