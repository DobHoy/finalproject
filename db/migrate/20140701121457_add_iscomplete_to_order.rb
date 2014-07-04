class AddIscompleteToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :iscomplete, :boolean, null: false, default: false  
  end
end
