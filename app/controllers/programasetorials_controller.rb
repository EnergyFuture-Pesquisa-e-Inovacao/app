class ProgramasetorialsController < ApplicationController
  include ProgramasetorialsHelper
  before_action :set_programasetorial, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy]

  def teste
  
  end  
  # GET /programasetorials or /programasetorials.json
  def index
    if verificauser
      @programasetorials = Programasetorial.all
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /programasetorials/1 or /programasetorials/1.json
  def show
    if verificauser  
      @eventos=Evento.where(tipoobjeto:"Programa Setorial").order(Arel.sql('datainicio ASC'))
    else
      redirect_to '/users/sign_in'
    end     
  end

  # GET /programasetorials/new
  def new
    if verificauser
      @programasetorial = Programasetorial.new
    else
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /programasetorials/1/edit
  def edit
    if verificauser
    
    else
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /programasetorials or /programasetorials.json
  def create
    @programasetorial = Programasetorial.new(programasetorial_params)
    respond_to do |format|
      if @programasetorial.save!     
         notify_registrationprogset("create")
         format.html { redirect_to programasetorial_url(@programasetorial), notice: "Programasetorial was successfully created." }
         format.json { render :show, status: :created, location: @programasetorial }
        else
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @programasetorial.errors, status: :unprocessable_entity }
        end      
    end
  end

  # PATCH/PUT /programasetorials/1 or /programasetorials/1.json
  def update
    respond_to do |format|
      if @programasetorial.update(programasetorial_params)
          notify_registrationprogset("update")     
          format.html { redirect_to programasetorial_url(@programasetorial), notice: "Programasetorial was successfully updated." }
          format.json { render :show, status: :ok, location: @programasetorial } 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @programasetorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programasetorials/1 or /programasetorials/1.json
  def destroy
    @programasetorial.destroy
    respond_to do |format|
      format.html { redirect_to programasetorials_url, notice: "Programasetorial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def date_formatinvertida(date)
    date.strfdate('mm/dd/yyyy') unless date.blank?
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_programasetorial
      @programasetorial = Programasetorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def programasetorial_params
      params.require(:programasetorial).permit(
      :name, 
      :descricao,
      :descricaocurta,
      :main_imagepg,  
      :status,
      :quantengajamento,
      :quantinscricoes,
      :quantempresas,
      :ano,
      :empresa,
      :parceiro)
    end


 
end
