class AddInvoiceUrlToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :invoiceurl, :string
  end
end
