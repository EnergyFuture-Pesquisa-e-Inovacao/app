class AgendasController < ApplicationController
  include AgendasHelper
  before_action :set_agenda, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  
  # GET /agendas or /agendas.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      puts Rails.application.credentials.config[:var][:var_url_remoto]
      @agendas = Agenda.all   
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  # GET /agendas/1 or /agendas/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
      
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end     
  end

  # GET /agendas/new
  def new
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @agenda = Agenda.new
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /agendas/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin

    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /agendas or /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)
    respond_to do |format|
      if @agenda.save!
        agenda=Agenda.last
        @evento=Evento.new
        @evento.name=@agenda.name
        @evento.descricao=@agenda.descricao
        @evento.descricaocurta=@agenda.descricaocurta
        @evento.linkevento=@agenda.linkevento        
        @evento.idobjeto=agenda.id
        @evento.tipoobjeto="Agenda"
        @evento.datainicio=@agenda.datainicio
        @evento.datafim=@agenda.datafim
        @evento.horainicio=@agenda.horainicio
        @evento.horafim=@agenda.horafim     
        @evento.enviarparaparticipante=@agenda.enviarparaparticipante   
        @evento.status=@agenda.status
        @evento.tipoparticipanteconvite=@agenda.tipoparticipanteconvite
        delta_time = (@evento.horafim - @evento.horainicio)/60
        @evento.duration="%.2f" % delta_time       
        @evento.save!
        @evento=Evento.last
        @timeline=Timeline.new
        @timeline.idobjeto=evento.id
        @timeline.tipoobjeto="Eventos Agenda" 
        #thdi = evento.datainicio
        #thi = evento.horainicio
        #timeline.datahora=thdi.strftime("%d/%m/%Y")+" "+thi.strftime('%H:%M') 
        #timeline.status=agenda.status 
        @timeline.save!    
        notify_registrationagenda("create")
        format.html { redirect_to agenda_url(@agenda), notice: "Evento da Agenda was successfully created." }
        format.json { render :show, status: :created, location: @agenda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendas/1 or /agendas/1.json
  def update
    evento=Evento.where(tipoobjeto:"Agenda").where(idobjeto:@agenda.id)
    @evento=Evento.find(evento[0].id)
    #timeline=Timeline.where(tipoobjeto:"Eventos Agenda",idobjeto:evento[0].id)
    #@timeline=Timeline.find(timeline[0].id)
    respond_to do |format|
      if @agenda.update(agenda_params)
        @evento.datainicio=@agenda.datainicio
        @evento.name=@agenda.name
        @evento.descricao=@agenda.descricao
        @evento.descricaocurta=@agenda.descricaocurta
        @evento.linkevento=@agenda.linkevento
        @evento.datafim=@agenda.datafim
        @evento.horainicio=@agenda.horainicio
        @evento.horafim=@agenda.horafim       
        @evento.status=@agenda.status
        @evento.enviarparaparticipante=@agenda.enviarparaparticipante 
        @evento.tipoparticipanteconvite=@agenda.tipoparticipanteconvite 
        delta_time = (@evento.horafim - @evento.horainicio)/60
        @evento.duration="%.2f" % delta_time   
        @evento.save!
        notify_registrationagenda("update")
        format.html { redirect_to agenda_url(@agenda), notice: "Evento da Agenda was successfully updated." }
        format.json { render :show, status: :ok, location: @agenda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendas/1 or /agendas/1.json
  def destroy
    evento=Evento.where(tipoobjeto:"Agenda").where(idobjeto:@agenda.id)
     if evento[0].present?
      @evento=Evento.find(evento[0].id) 
      timeline=Timeline.where(tipoobjeto:"Eventos Agenda",idobjeto:evento[0].id)    
       if timeline[0].present?
        @timeline=Timeline.find(timeline[0].id)
        @timeline.destroy
       end 
       @evento.destroy
      end  
    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: "Agenda was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def date_formatinvertida(date)
    date.strfdate('mm/dd/yyyy') unless date.blank?
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_agenda
      @agenda = Agenda.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agenda_params
      params.require(:agenda).permit(
      :name, 
      :descricao,
      :descricaocurta,
      :main_image,
      :datainicio, 
      :datafim,
      :horainicio,
      :horafim,
      :duration,
      :status,
      :category,
      :enviarparaparticipante,
      :tipoparticipanteconvite,
      :linkevento,
      :tipoevento)
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
