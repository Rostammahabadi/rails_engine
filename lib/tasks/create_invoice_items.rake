desc 'it creates all invoice items'
task :create_invoice_items do
  ActiveRecord::Base.connection.reset_pk_sequence!('invoice_items')
  require 'csv'
  CSV.foreach('db/invoice_items.csv', headers: true) do |row|
    InvoiceItem.create(
      item_id: row[1],
      invoice_id: row[2],
      quantity: row[3],
      unit_price: row[4].to_f/100.round(2),
      created_at: row[5],
      updated_at: row[6]
    )
  end
end
