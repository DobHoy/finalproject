class AddInstagramUrlToLineitems < ActiveRecord::Migration
  def change
    add_column :lineitems, :instagram_url, :text
  end
end
