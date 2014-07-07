class AddRoleToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :role, :string
  end
end
