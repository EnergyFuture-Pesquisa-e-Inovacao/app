class TextosController < ApplicationController
  include TextosHelper
  before_action :set_texto, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  

  # GET /textos or /textos.json
  def index
    if verificauser
      @textos = Texto.all
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /textos/1 or /textos/1.json
  def show
    if verificauser   
        
    else
        redirect_to '/users/sign_in'
    end     
  end

    # GET /textos/new
  def new
    if verificauser
      @programasetorial=Programasetorial.find(params[:idpg])
      @texto = Texto.new
      @texto.idobjeto=@programasetorial.id
      @texto.tipoobjeto="Programa Setorial"
    else
      redirect_to '/users/sign_in' 
    end   
  end


  # GET /textos/1/edit
  def edit
    if verificauser   
        
    else
        redirect_to '/users/sign_in'
    end 
  end

  # POST /textos or /textos.json
  def create
    puts "ESTOU NO CREATE1"
    puts params[:idpg]
    puts "ESTOU NO CREATE2"
    @texto = Texto.new(texto_params)
    @programasetorial=Programasetorial.find(@texto.idobjeto)
    data=DateTime.current - 3.hours
    @texto.datahoraindice=data
    timeline=Timeline.where(idobjeto:@programasetorial,tipoobjeto:"Programa Setorial")
    @timeline=Timeline.find(timeline[0].id)
    @texto.indicetm=@timeline.indiceobjetos
    respond_to do |format|
      if @texto.save
        @timeline.indiceobjetos=@timeline.indiceobjetos+1
        @timeline.save 
        ###notify_registrationtextoprogramasetorial("add")  
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Texto was successfully criado." }
        format.json { render :show, status: :ok, location: @texto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /textos/1 or /textos/1.json
  def update
    respond_to do |format|
      if @texto.update(texto_params)
        @texto.save!
        @programasetorial=Programasetorial.find(@texto.idobjeto)
        #notify_registrationtextoprogramasetorial("up")
        format.html { redirect_to programasetorial_url(@programasetorial), notice: "Texto was successfully updated." }
        format.json { render :show, status: :ok, location: @texto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @texto.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    if @timeline.present?
      @timeline.destroy
    end  
    @texto.destroy
    respond_to do |format|
      format.html { redirect_to agendas_url, notice: "Texto was successfully destroyed." }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_texto
      if params[:id]!="newarps"
      @evento = Evento.find(params[:id])
      timeline = Timeline.where(tipoobjeto:"Programa Setorial",idobjeto:@texto.id)
       if timeline[0].present?
        @timeline = Timeline.find(timeline[0].id)
       end 
      end
    end

    # Only allow a list of trusted parameters through.
    def texto_params
      params.require(:texto).permit(:title,:conteudo,:status,:idobjeto,:tipoobjeto)
    end

     
end
