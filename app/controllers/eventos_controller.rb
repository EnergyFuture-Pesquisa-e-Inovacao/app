class EventosController < ApplicationController
  include EventosHelper
  before_action :set_evento, only: %i[ show edit update destroy ]
  before_action :set_eventop, only: %i[ showp ]
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

  def showp
    puts "TESTE showp1"
    puts params[:idobjeto]
    puts "TESTE showp2"
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
    timeline=Timeline.where(idobjeto:@evento.idobjeto,tipoobjeto:"Programa Setorial")
    @timeline=Timeline.find(timeline[0].id)
    @evento.indicetm=@timeline.indiceobjetos
    @evento.timelineid=@timeline.id
    thdi = @evento.datainicio
    thi = @evento.horainicio
    @evento.datahoraindice=thi.strftime('%H:%M')+" "+thdi.strftime("%d/%m/%Y") 
    respond_to do |format|
      if @evento.save!
        #evento=Evento.last
        #@timeline.idobjeto=evento.id
        #@timeline.tipoobjeto="Programa Setorial"
        #@timeline.status=evento.status
        @timeline.indiceobjetos=@timeline.indiceobjetos+1
        @timeline.save 
        notify_registrationeventoprogramasetorial("add")  
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Evento foi Criado com Sucesso!" }
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
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Evento foi Editado com Sucesso!" }
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
      format.html { redirect_to agendas_url, notice: "Evento foi Destruído com Sucesso!" }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      if (params[:id]!="newevps")and(params[:id]!="showp")
      @evento = Evento.find(params[:id])
      timeline = Timeline.where(tipoobjeto:"Programa Setorial",idobjeto:@evento.id)
       if timeline[0].present?
        @timeline = Timeline.find(timeline[0].id)
       end 
      elsif params[:id]=="showp" 
        evento = Evento.where(idobjeto:params[:idobjeto],tipoobjeto:"Programa Setorial")
        @evento = Evento.find(evento[0].id)
        @programasetorial=Programasetorial.find(params[:idobjeto])
        timeline = Timeline.where(tipoobjeto:"Programa Setorial",idobjeto:@evento.id)
         if timeline[0].present?
          @timeline = Timeline.find(timeline[0].id)
         end        
      end
    end

    def set_eventop
      evento = Evento.where(idobjeto:params[:idobjeto],tipoobjeto:"Programa Setorial")
      @evento = Evento.find(evento[0].id)
      timeline = Timeline.where(tipoobjeto:"Programa Setorial",idobjeto:@evento.id)
       if timeline[0].present?
        @timeline = Timeline.find(timeline[0].id)
       end 
    end    

    # Only allow a list of trusted parameters through.
    def evento_params
      params.require(:evento).permit(:datainicio,:datafim,:horainicio,:horafim,
       :status,:enviarparaparticipante,:duration,:tipoobjeto,:idobjeto,:linkevento,:title,
       :descricaocurta)
    end
   
end
