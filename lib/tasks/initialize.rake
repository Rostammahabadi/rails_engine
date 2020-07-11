desc "loading data into database"
task initialize: [ 'db:drop', 'db:create', 'db:migrate' ] do
  Rake::Task[:create_customers].invoke
  puts "Created #{Customer.all.length} Customers"
  Rake::Task[:create_merchants].invoke
  puts "Created #{Merchant.all.length} Merchants"
  Rake::Task[:create_items].invoke
  puts "Created #{Item.all.length} Items"
  Rake::Task[:create_invoices].invoke
  puts "Created #{Invoice.all.length} Invoices"
  Rake::Task[:create_invoice_items].invoke
  puts "Created #{InvoiceItem.all.length} Invoice Items"
  Rake::Task[:create_transactions].invoke
  puts "Created #{Transaction.all.length} Transactions"
  puts "Successfully created objects"
end
