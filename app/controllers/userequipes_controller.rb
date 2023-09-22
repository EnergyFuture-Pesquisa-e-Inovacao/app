class UserequipesController < ApplicationController
  before_action :set_userequipe, only: %i[ show edit update destroy ]

  # GET /userequipes or /userequipes.json
  def index
    @userequipes = Userequipe.all
  end

  # GET /userequipes/1 or /userequipes/1.json
  def show
  end

  # GET /userequipes/new
  def new
    @userequipe = Userequipe.new
  end

  # GET /userequipes/1/edit
  def edit
  end

  # POST /userequipes or /userequipes.json
  def create
    @userequipe = Userequipe.new(userequipe_params)

    respond_to do |format|
      if @userequipe.save
        format.html { redirect_to userequipe_url(@userequipe), notice: "Userequipe was successfully created." }
        format.json { render :show, status: :created, location: @userequipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @userequipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /userequipes/1 or /userequipes/1.json
  def update
    respond_to do |format|
      if @userequipe.update(userequipe_params)
        format.html { redirect_to userequipe_url(@userequipe), notice: "Userequipe was successfully updated." }
        format.json { render :show, status: :ok, location: @userequipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @userequipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userequipes/1 or /userequipes/1.json
  def destroy
    @userequipe.destroy

    respond_to do |format|
      format.html { redirect_to userequipes_url, notice: "Userequipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_userequipe
      @userequipe = Userequipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def userequipe_params
      params.require(:userequipe).permit(:user_id, :empresa_id)
    end
end
