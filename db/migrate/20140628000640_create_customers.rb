class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :token
      t.text :address

      t.timestamps
    end
  end
end
