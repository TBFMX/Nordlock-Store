module CurrentUser
	extend ActiveSupport::Concern

  def get_user
    @userz = User.find_by(id: session[:user_id])
    
  end
  
  def get_mail
    @user = User.find_by(id: session[:user_id])

    @mail = @user.email
  end

end