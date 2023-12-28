class PlanosController < ApplicationController
  include PlanosHelper
  before_action :set_plano, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy]

  def teste
  
  end  
  # GET /planos or /planos.json
  def index
    if verificauser
      @planos = Plano.all
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /planos/1 or /planos/1.json
  def show
    if verificauser

    else
      redirect_to '/users/sign_in'
    end     
  end

  # GET /planos/new
  def new
    if verificauser
      @plano = Plano.new
    else
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /planos/1/edit
  def edit
    if verificauser

    else
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /planos or /planos.json
  def create
    @plano = Plano.new(plano_params)
    respond_to do |format|
      if @plano.save
        notify_registrationplan("create")
        format.html { redirect_to plano_url(@plano), notice: "Plano foi Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @Plano }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plano.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planos/1 or /planos/1.json
  def update
    respond_to do |format|
      if @plano.update(plano_params)
        notify_registrationplan("update")
        format.html { redirect_to plano_url(@plano), notice: "Plano foi Editado com Sucesso!" }
        format.json { render :show, status: :ok, location: @Plano }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planos/1 or /planos/1.json
  def destroy
    @plano.destroy
    respond_to do |format|
      format.html { redirect_to planos_url, notice: "Plano foi Destruído com Sucesso!" }
      format.json { head :no_content }
    end
  end
  #teste aws
  def upload_to_s3(file_path, s3_key)
    object = S3_BUCKET.object(s3_key)
    File.open(file_path, 'rb') do |file|
      object.put(body: file)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plano
      @plano = Plano.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plano_params
      params.require(:plano).permit(:name, :status)
    end
end