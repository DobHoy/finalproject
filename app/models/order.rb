class Order < ActiveRecord::Base
  attr_accessible :shipped, :total

  belongs_to :customer
  has_many :lineitems
end
