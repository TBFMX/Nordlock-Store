class ReviewCartController < ApplicationController
  before_action :set_cart
  def index
  end

  def sender
  	 Mailer.create_user("arturito@tbf.mx").deliver
  end
end
