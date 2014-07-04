class Order < ActiveRecord::Base
  attr_accessible :shipped, :total, :lineitems, :photo, :lineitems_attributes

  belongs_to :customer
  belongs_to :cart
  has_many :lineitems

  accepts_nested_attributes_for :lineitems, reject_if: proc { |attributes| attributes[:quantity].to_i <= 0 }

  def self.in_progress
    where :iscomplete => false
  end


end
