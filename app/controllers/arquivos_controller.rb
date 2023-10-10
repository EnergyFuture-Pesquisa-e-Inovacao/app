class ArquivosController < ApplicationController
  include ArquivosHelper
  before_action :set_arquivo, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  

  # GET /arquivos or /arquivos.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @arquivos = Arquivo.all
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  # GET /arquivos/1 or /arquivos/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
      
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end     
  end


  # GET /arquivos/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
    
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /arquivos or /arquivos.json
  def create
    @arquivo = Arquivo.new(arquivo_params)
    @programasetorial=Programasetorial.find(@arquivo.idobjeto)  
    respond_to do |format|
      if @arquivo.save!
        arquivo=Arquivo.last
        @timeline=Timeline.new
        @timeline.idobjeto=arquivo.id
        @timeline.tipoobjeto="Arquivos PG"
        @timeline.status=arquivo.status
        @timeline.save 
        notify_registrationarquivoprogramasetorial("add")  
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Arquivo was successfully criado." }
        format.json { render :show, status: :ok, location: @arquivo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arquivos/1 or /arquivos/1.json
  def update
    respond_to do |format|
      if @arquivo.update(arquivo_params)
        @arquivo.save!
        @programasetorial=Programasetorial.find(@arquivo.idobjeto)
        notify_registrationarquivoprogramasetorial("up")
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Arquivo was successfully updated." }
        format.json { render :show, status: :ok, location: @arquivo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arquivo.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    if @timeline.present?
      @timeline.destroy
    end  
    @arquivo.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: "Arquivo was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arquivo
      if params[:id]!="newarps"
      @evento = Evento.find(params[:id])
      timeline = Timeline.where(tipoobjeto:"Eventos",idobjeto:@arquivo.id)
       if timeline[0].present?
        @timeline = Timeline.find(timeline[0].id)
       end 
      end
    end

    # Only allow a list of trusted parameters through.
    def arquivo_params
      params.require(:arquivo).permit(:datainicio,:datafim,:horainicio,:horafim,
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
