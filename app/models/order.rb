class Order < ActiveRecord::Base
	belongs_to :client
	belongs_to :cart
	has_one :transaccion
	has_one :address
end
