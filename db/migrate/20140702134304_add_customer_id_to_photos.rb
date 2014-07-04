class AddCustomerIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :customer_id, :integer
  end
end
