class EventosController < ApplicationController
  include EventosHelper
  before_action :set_evento, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy]

  def teste
  
  end  

  # GET /eventos or /eventos.json
  def index
    if verificauser
      @eventos = Evento.all
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /eventos/1 or /eventos/1.json
  def show
    if verificauser 
      
    else
      redirect_to '/users/sign_in'
    end     
  end


  # GET /eventos/1/edit
  def edit
    if verificauser
    
    else
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /eventos or /eventos.json
  def create
    @evento = Evento.new(evento_params)
    @programasetorial=Programasetorial.find(@evento.idobjeto)
    delta_time = (@evento.horafim.to_i- @evento.horainicio.to_i)/60
    @evento.duration="%.2f" % delta_time    
    respond_to do |format|
      if @evento.save!
        evento=Evento.last
        @timeline=Timeline.new
        @timeline.idobjeto=evento.id
        @timeline.tipoobjeto="Eventos PG"
        @timeline.status=evento.status
        @timeline.save 
        notify_registrationeventoprogramasetorial("add")  
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Evento was successfully criado." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1 or /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        delta_time = (@evento.horafim.to_i- @evento.horainicio.to_i)/60
        @evento.duration="%.2f" % delta_time  
        @evento.save!
        @programasetorial=Programasetorial.find(@evento.idobjeto)
        notify_registrationeventoprogramasetorial("up")
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Evento was successfully updated." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    if @timeline.present?
      @timeline.destroy
    end  
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: "Agenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      if params[:id]!="newevps"
      @evento = Evento.find(params[:id])
      timeline = Timeline.where(tipoobjeto:"Eventos",idobjeto:@evento.id)
       if timeline[0].present?
        @timeline = Timeline.find(timeline[0].id)
       end 
      end
    end

    # Only allow a list of trusted parameters through.
    def evento_params
      params.require(:evento).permit(:datainicio,:datafim,:horainicio,:horafim,
       :status,:enviarparaparticipante,:duration,:tipoobjeto,:idobjeto,:linkevento,
       :descricaocurta)
    end
   
end
