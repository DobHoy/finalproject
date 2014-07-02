class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :provider
      t.string :uid
      t.references :customer

      t.timestamps
    end
    add_index :authentications, :customer_id
  end
end
