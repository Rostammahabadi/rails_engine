desc 'it creates all items'
task :create_items do
  ActiveRecord::Base.connection.reset_pk_sequence!('items')
  require 'csv'
  CSV.foreach('db/items.csv', headers: true) do |row|
    Item.create(
      name: row[1],
      description: row[2],
      unit_price: row[3].to_f/100,
      merchant_id: row[4],
      created_at: row[5],
      updated_at: row[6]
    )
  end
end
