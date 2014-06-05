class ProductosController < ApplicationController
	skip_before_action :authorize
	add_breadcrumb I18n.t("breadcrumbs.productos"), :productos_path
  def index
  	@products = Product.all

  end
  
end
