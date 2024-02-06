class IcpsController < ApplicationController
  #include IcpsHelper
  before_action :set_icp, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy]

  def teste
  
  end  
  # GET /icps or /icps.json
  def index
    if verificauser
      @icps = Icp.all
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /icps/1 or /icps/1.json
  def show
    if verificauser   
      
    else
      redirect_to '/users/sign_in'
    end     
  end

  # GET /icps/new
  def new
    if verificauser
      @icp = Icp.new
    else
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /icps/1/edit
  def edit
    if verificauser

    else
      redirect_to '/users/sign_in' 
    end  
  end

  # POST /icps or /icps.json
  def create
    @icp = Icp.new(icp_params)
    respond_to do |format|
      if @icp.save
        NotifyRegistrationicpJob.set(wait: 3.seconds).perform_later("create",@icp)
        format.html { redirect_to icp_url(@icp), notice: "Icp foi Criado com Sucesso!" }
        format.json { render :show, status: :created, location: @icp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @icp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /icps/1 or /icps/1.json
  def update
    respond_to do |format|
      if @icp.update(icp_params)
        NotifyRegistrationicpJob.set(wait: 3.seconds).perform_later("update",@icp)
        format.html { redirect_to icp_url(@icp), notice: "Icp foi Editado com Sucesso!" }
        format.json { render :show, status: :ok, location: @icp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @icp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /icps/1 or /icps/1.json
  def destroy
    @icp.destroy
    respond_to do |format|
      format.html { redirect_to icps_url, notice: "Icp foi Destruído com Sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_icp
      @icp = Icp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def icp_params
      params.require(:icp).permit(:name, :status)
    end

    
end
