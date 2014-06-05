class StoreController < ApplicationController
  include CurrentCart
	before_action :set_cart
	before_action :autorizar


  def index
  	@products = Product.order(:title)
  end

  private
  	def autorizar
        unless session[:mod0] == true
          redirect_to "/"
        end
    end
end
