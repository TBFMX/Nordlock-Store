class CatalogoController < ApplicationController
	skip_before_action :authorize
	before_action :set_cart
  def index
  	@products = Product.all
  	@category = params[:category]
  end
  def pedido
  	
  end	

end
