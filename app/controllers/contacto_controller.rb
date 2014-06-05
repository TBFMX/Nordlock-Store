class ContactoController < ApplicationController
    skip_before_action :authorize
  def index
    add_breadcrumb I18n.t("breadcrumbs.contact"), "/contacto"
  end

  def sender
    @datos = contacto_params
    Mailer.sended(@datos).deliver 
  end

  def fail
  end

  def success
  end

  private

  def contacto_params
    params.permit(:nombre, :email, :empresa, :telefono, :cp, :pais, :comentarios)
  end

end
