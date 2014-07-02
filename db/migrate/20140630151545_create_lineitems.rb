class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.integer :unit_price

      t.timestamps
    end
  end
end
