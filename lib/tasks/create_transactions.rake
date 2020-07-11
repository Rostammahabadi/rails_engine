desc 'it creates all transactions'
task :create_transactions do
  require 'csv'
  CSV.foreach('db/transactions.csv', headers: true) do |row|
    Transaction.create(
      invoice_id: row[1],
      credit_card_number: row[2],
      credit_card_expiration_date: row[3],
      result: row[4],
      created_at: row[5],
      updated_at: row[6]
    )
  end
end
