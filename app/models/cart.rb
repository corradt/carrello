class Cart < ActiveRecord::Base
	has_many :ordered_products, dependent: :destroy
  belongs_to :user

	
  def add_product(product_id,quantity)
  	current_item = ordered_products.find_by(product_id: product_id)
  	if current_item
  		current_item.quantity += quantity.to_i
  		current_item.save
    else
    	current_item = ordered_products.build(product_id: product_id, quantity:quantity)
    end
    current_item
  end

  # total order price
  def total_price
    ordered_products.to_a.sum { |item| item.total_price }
  end

  def tax_amount
    total_price * 0.045
  end

  def number_items
    ordered_products.sum(:quantity)
  end














end
