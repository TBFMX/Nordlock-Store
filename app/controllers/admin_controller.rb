class AdminController < ApplicationController
	before_action :autorizar
  def index
  	@total_users = User.count
  end
private
  def autorizar
        unless session[:mod0] == true
          redirect_to "/"
        end
    end
end
