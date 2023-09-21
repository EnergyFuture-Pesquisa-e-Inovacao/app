class AcademiesController < ApplicationController
  before_action :set_academy, only: %i[ show edit update destroy]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  
  # GET /academies or /academies.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      agendasid = Agenda.select(:idevento).where(tipoevento: "Academy").where(status: "ativo").order(:datainiciom1)
      @academies = Academy.where(id:agendasid)
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  # GET /academies/1 or /academies/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
     
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end     
  end

  # GET /academies/new
  def new
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @academy = Academy.new
      @agenda = Agenda.new
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /academies/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
    
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /academies or /academies.json
  def create
    @academy = Academy.new(academy_params)
    @agenda = Agenda.new(academy_params)
    delta_time = (@agenda.horafim - @agenda.horainicio)/60
    @agenda.duration="%.2f" % delta_time
    respond_to do |format|
      if @academy.save!
        academy=Academy.last
        @agenda.tipoevento="Academy"
        @agenda.idevento=academy.id  
        if @agenda.save       
         #create_academyz
         format.html { redirect_to academy_url(@academy), notice: "Evento da Academy was successfully created." }
         format.json { render :show, status: :created, location: @academy }
        else
         format.html { render :new, status: :unprocessable_entity }
         format.json { render json: @academy.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @academy.errors, status: :unprocessable_entity }
       end        
    end
  end

  # PATCH/PUT /academies/1 or /academies/1.json
  def update
    respond_to do |format|
      if @academy.update(academy_params) 
         @agenda.duration=@academy.duration
         @agenda.save!     
         #if @agenda = Agenda.update(agenda_params)
          #@agenda.save!         
          format.html { redirect_to academy_url(@academy), notice: "Evento da Academy was successfully updated." }
          format.json { render :show, status: :ok, location: @academy }
         #else
          #format.html { render :edit, status: :unprocessable_entity }
          #format.json { render json: @academy.errors, status: :unprocessable_entity }
         #end  
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @academy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academies/1 or /academies/1.json
  def destroy
    @academy.destroy
    respond_to do |format|
      format.html { redirect_to academies_url, notice: "Academy was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private

  def date_formatinvertida(date)
    date.strfdate('mm/dd/yyyy') unless date.blank?
  end


  def create_academyz
    ZapierRuby.configure do |c|
      #c.web_hooks = { create_academyz: "10142775/39nn3pn" }
    end  
    ZapierRuby::Zapper.new(:create_academyz).zap(@academy.attributes)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_academy
      @academy = Academy.find(params[:id])
      agenda=Agenda.where(tipoevento: "Academy",idevento:@academy.id)
      @agenda=Agenda.find(agenda[0].id)
    end

    # Only allow a list of trusted parameters through.
    def academy_params
      params.require(:academy).permit(
      :name, 
      :descricao,
      :fotomaior, 
      :fotomenor, 
      :status,
      :datainiciom1,
      :datafimm1,
      :horainicio,
      :horafim,
      :duration,
      :status,
      :category,
      :enviarparaparticipante)
    end
    
    def agenda_params
      params.require(:agenda).permit(
      :name, 
      :descricao,
      :fotomaior, 
      :fotomenor, 
      :status,
      :datainiciom1,
      :datafimm1,
      :horainicio,
      :horafim,
      :duration,
      :status,
      :category,
      :enviarparaparticipante)
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
