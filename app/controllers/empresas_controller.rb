class EmpresasController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_user!, only: [:teste]
  before_action :set_empresa, only: %i[ show edit update destroy ]
  
  def teste
  
  end  
  # GET /empresas or /empresas.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @empresas = Empresa.all
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end 
  end

  # GET /empresas/1 or /empresas/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
      
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end    
  end

  # GET /empresas/new
  def new
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @empresa = Empresa.new
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

  # GET /empresas/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin

    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end   
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    respond_to do |format|
      if @empresa.save
          #create_empresaz
          format.html { redirect_to empresa_url(@empresa), notice: "Empresa was successfully created." }
          format.json { render :show, status: :created, location: @empresa }
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
  #def create_empresaz
  #  ZapierRuby.configure do |c|
  #    c.web_hooks = { create_empresaz: "10142775/39v17q5" }
  #  end  
  #  ZapierRuby::Zapper.new(:create_empresaz).zap(@empresa.attributes)
  #end

  #def update_userz
  #  ZapierRuby.configure do |c|
  #    c.web_hooks = { update_userz: "10142775/39nn3b0" }
  #  end  
  #  ZapierRuby::Zapper.new(:update_userz).zap(@user.attributes)
  #end
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:nomefantasia,:razaosocial,:cnpj, :plano_id, :status)
    end
    def verificauser
      if current_user.present?
        true
      else
        false
      end  
    end  

    def verificaadmin
      if current_admin.present?
        true
      else
        false
      end  
    end   

end
