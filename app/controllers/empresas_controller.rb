class EmpresasController < ApplicationController
  before_action :set_empresa, only: %i[ show edit update destroy ]
  

  # GET /empresas or /empresas.json
  def index
    @empresas = Empresa.all
  end

  # GET /empresas/1 or /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    @user=User.find(current_user.id)
    @empresa.plano_id=@user.plano_id
    @empresa.status="ativo"
    respond_to do |format|
      if @empresa.save
        empresa=Empresa.last
        @user.empresa_id=empresa.id
        if @user.save
          create_empresaz
          update_userz
          format.html { redirect_to empresa_url(@empresa), notice: "Empresa was successfully created." }
          format.json { render :show, status: :created, location: @empresa }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @empresa.errors, status: :unprocessable_entity }
        end  
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /empresas/1 or /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to empresa_url(@empresa), notice: "Empresa was successfully updated." }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1 or /empresas/1.json
  def destroy
    @empresa.destroy

    respond_to do |format|
      format.html { redirect_to empresas_url, notice: "Empresa was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def create_empresaz
    ZapierRuby.configure do |c|
      c.web_hooks = { create_empresaz: "10142775/39v17q5" }
    end  
    ZapierRuby::Zapper.new(:create_empresaz).zap(@empresa.attributes)
  end

  def update_userz
    ZapierRuby.configure do |c|
      c.web_hooks = { update_userz: "10142775/39nn3b0" }
    end  
    ZapierRuby::Zapper.new(:update_userz).zap(@user.attributes)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:nomefantasia,:razaosocial,:cnpj, :plano_id, :status)
    end

end
