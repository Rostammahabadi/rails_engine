class ChangeCustomers < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :created_at
    add_column :customers, :created_at, :datetime
  end
end
