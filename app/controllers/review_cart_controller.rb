class ReviewCartController < ApplicationController
  before_action :set_cart
  before_action :get_user
  def index
  end

  def sender

  	 Mailer.cotizacion("arturito@tbf.mx",@cart,@userz).deliver

  	@cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end