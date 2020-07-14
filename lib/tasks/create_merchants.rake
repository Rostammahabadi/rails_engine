desc 'it creates all merchants'
task :create_merchants do
  ActiveRecord::Base.connection.reset_pk_sequence!('merchants')
  require 'csv'
  CSV.foreach('db/merchants.csv', headers: true) do |row|
    Merchant.create(
      name: row[1],
      created_at: row[2],
      updated_at: row[3]
    )
  end
end
