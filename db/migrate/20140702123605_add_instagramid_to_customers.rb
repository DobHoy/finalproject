class AddInstagramidToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :instagramid, :integer
  end
end
