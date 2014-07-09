class Photo < ActiveRecord::Base
  attr_accessible :remote_image_url, :customer, :customer_id, :instagram_url, :instagram_id
  mount_uploader :image, ImageUploader
  belongs_to :customer
  has_many :lineitems, primary_key: :instagram_id, foreign_key: :instagram_id
end
