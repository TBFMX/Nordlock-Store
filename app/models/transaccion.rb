class Transaccion < ActiveRecord::Base
	belongs_to :client
	belongs_to :order
end
