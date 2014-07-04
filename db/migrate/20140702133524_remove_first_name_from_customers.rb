class RemoveFirstNameFromCustomers < ActiveRecord::Migration
 def change
    remove_column :customers, :first_name
    remove_column :customers, :last_name
  end
end
