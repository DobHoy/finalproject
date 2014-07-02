class Product < ActiveRecord::Base
  attr_accessible :current_price, :description, :example_url, :name

  has_many :lineitems
end
