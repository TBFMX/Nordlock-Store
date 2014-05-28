class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	#<%= button_to 'Add to Cart', line_items_path(product_id: product, quantity: quantity), remote: true %>
	def add_product(product_id, quantity)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			current_item.quantity = quantity 
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
	def remove_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		if current_item
			if current_item.quantity >= 0
				current_item.quantity += -1
			end
		#else
		#	current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
	#<%= button_to 'Add to Cart', line_items_path(product_id: product),  method: :delete, remote: true %>
	def destroy_product(product_id)
		current_item = line_items.find_by(product_id: product_id)
		current_item.destroy
		respond_to do |format|
      		format.html { redirect_to @line_item.cart, notice: 'Client was successfully destroyed.' }
      		format.json { head :no_content }
    	end	
	end
	def total_price
		line_items.to_a.sum { |item| item.total_price }
	end
end
