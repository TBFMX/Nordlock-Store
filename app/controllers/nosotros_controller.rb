class NosotrosController < ApplicationController
	skip_before_action :authorize
	add_breadcrumb I18n.t("breadcrumbs.nosotros"), "/nosotros"
  def index
  end
end
