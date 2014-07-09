class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :instagram_url
      t.references :customer, index: true
      t.string :instagram_id
      t.text :image

      t.timestamps
    end
  end
end