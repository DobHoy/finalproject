class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :example_url
      t.integer :current_price

      t.timestamps
    end
  end
end
