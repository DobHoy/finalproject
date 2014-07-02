class Lineitem < ActiveRecord::Base
  attr_accessible :quantity, :unit_price

  belongs_to :product
  belongs_to :order
  belongs_to :photo
end
