class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :unit_price
      t.references :merchant, null: false, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
