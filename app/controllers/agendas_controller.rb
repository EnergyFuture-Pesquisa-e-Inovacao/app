class AgendasController < ApplicationController
  #include AgendasHelper
  before_action :set_agenda, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  #before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy]

  def teste
  
  end  
  # GET /agendas or /agendas.json
  def index
    if verificauser
      @agendas = Agenda.all   
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /agendas/1 or /agendas/1.json
  def show
    if verificauser   
      
    else
      redirect_to '/users/sign_in'
    end     
  end

  # GET /agendas/new
  def new
    if verificaadminteste
      @agenda = Agenda.new
    else
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /agendas/1/edit
  def edit
    if verificaadminteste

    else
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /agendas or /agendas.json
  def create
    @agenda = Agenda.new(agenda_params)
    @agenda.indicetm=1
    respond_to do |format|
      if @agenda.save!
        agenda=Agenda.last
        timeline=Timeline.new
        timeline.indiceobjetos=1
        timeline.idobjeto=@agenda.id
        timeline.tipoobjeto="Agenda" 
        timeline.save!
        @timeline=Timeline.last
        @evento=Evento.new
        @evento.indicetm=1
        @evento.name=@agenda.name
        @evento.title=@agenda.title
        @evento.descricao=@agenda.descricao
        @evento.descricaocurta=@agenda.descricaocurta
        @evento.linkevento=@agenda.linkevento        
        @evento.idobjeto=@agenda.id
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
        @evento.timelineid=@timeline.id 
        thdi = @evento.datainicio
        thi = @evento.horainicio
        @evento.datahoraindice=thi.strftime('%H:%M')+" "+thdi.strftime("%d/%m/%Y")     
        @evento.save!
        @evento=Evento.last

        #timeline.datahora=thdi.strftime("%d/%m/%Y")+" "+thi.strftime('%H:%M') 
        #timeline.status=agenda.status 
           
        #notify_registrationagenda("create")
        NotifyRegistrationagendaJob.set(wait: 3.seconds).perform_later("create",@agenda)
        format.html { redirect_to agenda_url(@agenda), notice: "Evento da Agenda foi Criado com Sucesso!" }
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
    #timeline=Timeline.where(tipoobjeto:"Agenda",idobjeto:evento[0].id)
    #@timeline=Timeline.find(timeline[0].id)
    respond_to do |format|
      if @agenda.update(agenda_params)
        @evento.datainicio=@agenda.datainicio
        @evento.name=@agenda.name
        @evento.title=@agenda.title
        @evento.descricao=@agenda.descricao
        @evento.descricaocurta=@agenda.descricaocurta
        @evento.linkevento=@agenda.linkevento
        @evento.datafim=@agenda.datafim
        @evento.horainicio=@agenda.horainicio
        @evento.horafim=@agenda.horafim       
        @evento.status=@agenda.status
        @evento.enviarparaparticipante=@agenda.enviarparaparticipante 
        @evento.tipoparticipanteconvite=@agenda.tipoparticipanteconvite
        thdi = @evento.datainicio
        thi = @evento.horainicio
        @evento.datahoraindice=thi.strftime('%H:%M')+" "+thdi.strftime("%d/%m/%Y")
        delta_time = (@evento.horafim - @evento.horainicio)/60
        @evento.duration="%.2f" % delta_time   
        @evento.save!
        #notify_registrationagenda("update")
        NotifyRegistrationagendaJob.set(wait: 3.seconds).perform_later("update",@agenda)
        format.html { redirect_to agenda_url(@agenda), notice: "Evento da Agenda foi Editado com Sucesso!" }
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
      timeline=Timeline.where(tipoobjeto:"Agenda",idobjeto:evento[0].id)    
       if timeline[0].present?
        @timeline=Timeline.find(timeline[0].id)
        @timeline.destroy
       end 
       @evento.destroy
      end  
    @agenda.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: "Agenda foi Destruído com Sucesso!" }
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
      :title,
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


end
