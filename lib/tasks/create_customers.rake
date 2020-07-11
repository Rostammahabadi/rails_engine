desc 'it creates all customers'
task :create_customers do
  require 'csv'
  CSV.foreach('db/customers.csv', headers: true) do |row|
    Customer.create(
      first_name: row[1],
      last_name: row[2],
      created_at: row[3],
      updated_at: row[4]
    )
  end
end
