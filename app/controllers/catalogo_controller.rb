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

    add_breadcrumb I18n.t("breadcrumbs.productos"), :productos_path
    case @category 
      when "arandela_protekt"
        add_breadcrumb I18n.t("breadcrumbs.delta"), "/catalogo/index?category=arandela_protekt"
      when "arandela_316L" 
        add_breadcrumb I18n.t("breadcrumbs.ino316"), "/catalogo/index?category=arandela_316L"
      when "arandela_254SMO" 
        add_breadcrumb I18n.t("breadcrumbs.ino254"), "/catalogo/index?category=arandela_254SMO"
      when "arandela_especiales" 
        add_breadcrumb I18n.t("breadcrumbs.especiales"), "/catalogo/index?category=arandela_especiales"
      else 
        redirect_to productos_path
    end 

  end
  def pedido
  	
  end

  
  	


end
