class EventosController < ApplicationController
  before_action :set_evento, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  




  # GET /icps or /icps.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @icps = Icp.all
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  # GET /icps/1 or /icps/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
      
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end     
  end

  # GET /icps/new
  #def newevps
   #if verificauser and !verificaadmin
  #    redirect_to '/users/sign_in'
  #  elsif !verificauser and verificaadmin
  #    respond_to do |format|
  #      format.html { redirect_to "/eventos/newevps", notice: "." }
  #     end     
  #  elsif !verificauser and !verificaadmin
  #    redirect_to '/users/sign_in' 
  #  end   
  #end

  # GET /icps/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
    
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /icps or /icps.json
  def create
    @evento = Evento.new(evento_params)
    respond_to do |format|
      if @evento.save!
        
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Evento was successfully criado." }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icp.errors, status: :unprocessable_entity }
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
