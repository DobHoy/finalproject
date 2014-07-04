class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :order
end
