class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def total_price
	product.unit_price * quantity
  end
end
