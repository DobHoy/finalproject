class Lineitem < ActiveRecord::Base
  attr_accessible :quantity,
                  :unit_price,
                  :instagram_id,
                  :product,
                  :product_id,
                  :order,
                  :order_id

  belongs_to :product
  belongs_to :order
  belongs_to :photo, primary_key: :instagram_id, foreign_key: :instagram_id

  # validates :quantity, :numericality => { :greater_than => 0}
end
