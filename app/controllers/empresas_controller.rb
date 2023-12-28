class EmpresasController < ApplicationController
  include EmpresasHelper
  before_action :authenticate_admin!
  before_action :authenticate_user!, only: [:teste]
  before_action :set_empresa, only: %i[ show edit update destroy ]
  after_action :loginterno, only: %i[update create destroy]
  
  def teste
  
  end  
  # GET /empresas or /empresas.json
  def index
    if verificauser
      @empresas = Empresa.all
    else
      redirect_to '/users/sign_in'
    end 
  end

  # GET /empresas/1 or /empresas/1.json
  def show
    if verificauser 
      
    else
      redirect_to '/users/sign_in'
    end    
  end

  # GET /empresas/new
  def new
    if verificauser
      @empresa = Empresa.new
    else
      redirect_to '/users/sign_in' 
    end  
  end

  # GET /empresas/1/edit
  def edit
    if verificauser

    else
      redirect_to '/users/sign_in' 
    end   
  end

  # POST /empresas or /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    respond_to do |format|
      if @empresa.save
        #empresa=Empresa.last
        #@equipe=Equipe.new 
        #@equipe.name="Equipe A" 
        #@equipe.empresa_id=empresa.id
        #@equipe.status="ativo"
        if @equipe.save 
          notify_registrationemp("create")
          format.html { redirect_to empresa_url(@empresa), notice: "Empresa foi Criada com Sucesso!" }
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
        notify_registrationemp("update")
        format.html { redirect_to empresa_url(@empresa), notice: "Empresa foi Editada com Sucesso!" }
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
      format.html { redirect_to empresas_url, notice: "Empresa foi Destruída com Sucesso!" }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empresa_params
      params.require(:empresa).permit(:nomefantasia,:razaosocial,:cnpj, :plano_id, :status)
    end


end
