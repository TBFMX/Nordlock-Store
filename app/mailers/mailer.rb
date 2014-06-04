class Mailer < ActionMailer::Base
  #before_action :get_user
  #before_action :set_cart
  default from: "Arturito"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.reset_password.subject
  #
  def reset_password(user,uemail)
    @greeting = "Hi"
    @user = user
    #mail to: uemail
    mail(:to => uemail, :subject => "Password Reset", :from => "Arturito")

  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.recover_password.subject
  #
  def recover_password(user,uemail)
    @greeting = "Hi"
    @user = user
    #mail to: uemail
    mail(:to => uemail, :subject => "Recuperacion de Password", :from => "Arturito", :reply_to =>"arturito@tbf.mx")
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset" , :from => "Arturito", :reply_to =>"arturito@tbf.mx"
  end

  def create_user(user)
    @user = user
    mail :to => user.email, :subject => "Se creo su usuario", :from => "\"Conserje\"<info@tbf.mx>", :reply_to =>"arturito@tbf.mx"
  end

  def destroy_user(user)
    @user = user
    mail :to => user.email, :subject => "Su usuario a sido destruido", :from => "Arturito", :reply_to =>"arturito@tbf.mx"
  end

  def sended(datos)
    @greeting = "Hi"
    @datos = datos

    mail(:to => "hugo@tbf.mx", :subject => "Nuevo Mensaje de Contacto NORD-LOCK", :from => "Arturito", :reply_to =>"arturito@tbf.mx")
  end

  def cotizacion(mail,cart,user)
    @cart = cart
    @user = user
    puts "-----------------------------------------------------------"
    puts @user.inspect
    puts "-----------------------------------------------------------"
    usermail = user.email
    mail(:to => mail, :subject => "Nuevo pedido", :from => "Arturito", :reply_to =>usermail)
   
  end  

  
end
