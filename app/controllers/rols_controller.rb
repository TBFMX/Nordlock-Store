class RolsController < ApplicationController
  before_action :autorizar
  before_action :set_rol, only: [:show, :edit, :update, :destroy]

  # GET /rols
  # GET /rols.json
  def index
    @rols = Rol.all
  end

  # GET /rols/1
  # GET /rols/1.json
  def show
  end

  # GET /rols/new
  def new
    @rol = Rol.new
  end

  # GET /rols/1/edit
  def edit
  end

  # POST /rols
  # POST /rols.json
  def create
    @rol = Rol.new(rol_params)

    respond_to do |format|
      if @rol.save
        format.html { redirect_to @rol, notice: 'Rol was successfully created.' }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rols/1
  # PATCH/PUT /rols/1.json
  def update
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to @rol, notice: 'Rol was successfully updated.' }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rols/1
  # DELETE /rols/1.json
  def destroy
    @rol.destroy
    respond_to do |format|
      format.html { redirect_to rols_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    def autorizar
        unless session[:mod0] == true
          redirect_to "/"
        end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_params
      params.require(:rol).permit(:rol_name, :admin, :module_1, :module_2, :module_3, :module_4, :module_5)
    end
end
