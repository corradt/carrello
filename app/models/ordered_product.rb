class OrderedProduct < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	def total_price
    	ordered_products.to_a.sum { |item| item.total_price }
  	end
end
