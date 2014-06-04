class CatalogoController < ApplicationController
	skip_before_action :authorize
	before_action :set_cart
  def index

     unless params[:product].nil?
  	  @products = Product.query(params[:product],params[:category])
      var_verify(@products)
      puts "-------------------------------------------------------------"
      puts @products.inspect
      puts params.inspect
      puts "-------------------------------------------------------------"

     else
      @products = Product.where(" category like ? ", params[:category])
      var_verify(@products)
      puts "-------------------------------------------------------------"
      puts @products.inspect
      puts "-------------------------------------------------------------"
      puts params.inspect
      puts "-------------------------------------------------------------"
     end   
  	@category = params[:category]
  end
  def pedido
  	
  end

  
  	


end
