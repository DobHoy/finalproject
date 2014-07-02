class AddIscompleteToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :iscomplete, :boolean
  end
end
