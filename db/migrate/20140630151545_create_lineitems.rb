class CreateLineitems < ActiveRecord::Migration
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.integer :unit_price
      t.references :photo
      t.references :order
      t.references :product
      t.string :instagram_id

      t.timestamps
    end
  end
end
