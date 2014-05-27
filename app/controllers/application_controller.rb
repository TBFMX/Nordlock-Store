class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include CurrentCart
  before_action :set_cart
  protect_from_forgery with: :exception
  before_action :authorize
  
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found   
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end
 
  #called by last route matching unmatched routes.  Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found2
    #raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
    redirect_to '/'
    #redirect_to root_url
  end
 
  #render 500 error
  def render_error(e)
    respond_to do |f|
      f.html{ render :template => "errors/500", :status => 500 }
      f.js{ render :partial => "errors/ajax_500", :status => 500 }
    end
  end
 
  #render 404 error
  def render_not_found(e)
    respond_to do |f|
      f.html{ render :template => "errors/404", :status => 404 }
      f.js{ render :partial => "errors/ajax_404", :status => 404 }
    end
  end
  def secure_save(variable)
      begin
       if variable.save
          return true

    rescue ActiveRecord::RecordNotFound    
      # handle not found error
      logger.error "no se encontro el registro que se solicito"
      return false
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
      logger.error ("hubo un error en el ActiveRecord" + logger.debug)
          rescue # StandardError
      # handle most other errors
    rescue Exception
      # handle everything else
    end
  end
  def var_verify(variable)
      begin
      if variable
          return true
    rescue ActiveRecord::RecordNotFound    
      # handle not found error
      logger.error "no se encontro el registro que se solicito"
      return false
    rescue ActiveRecord::ActiveRecordError
      # handle other ActiveRecord errors
      logger.error ("hubo un error en el ActiveRecord" + logger.debug)
          rescue # StandardError
      # handle most other errors
    rescue Exception
      # handle everything else
      
    end
  end
  def server_error(exception)
  # Whatever code that handles the exception

      ExceptionNotifier.notify_exception(exception,
    :env => request.env, :data => {:message => "was doing something wrong"})
  end






  

  protected
  	def authorize
  		unless User.find_by(id: session[:user_id])
  			#session[:lasurl]= request.original_url
  			redirect_to login_url , notice: "Please log in"
  		end        
  	end

end


