class Photo < ActiveRecord::Base
  attr_accessible :url

  belongs_to :customer
  has_many :lineitems
end
