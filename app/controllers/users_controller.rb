class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy]
  #before_action :update_userz, only: %i[ update ]
  before_action :authenticate_user!, only: %i[ show edit update destroy ]

  # GET /users or /users.json
 
  def index
    @users = User.all
  end

  # GET /users/1/edit
  def edit
    @user=User.find(current_user.id)
    if @user.plano_id.present?
      @plano=Plano.find(@user.plano_id)
     end 
     if @user.empresa_id.present?
       @empresa=Empresa.find(@user.empresa_id)
     else
       @empresa=Empresa.new
     end 
  end

  # GET /users/1/
    def show
      if @user.plano_id.present?
        @plano=Plano.find(@user.plano_id)
       end 
       if @user.empresa_id.present?
       @empresa=Empresa.find(@user.empresa_id)
       end 
       if @user.icp_id.present?
        @icp=Icp.find(@user.icp_id)
       end      
    end


    # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
        update_userz
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end 
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  def update_userz
    ZapierRuby.configure do |c|
      c.web_hooks = { update_userz: "10142775/39nn3b0" }
    end  
    ZapierRuby::Zapper.new(:update_userz).zap(@user.attributes)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email,:name,:phone,:empresa_id)
    end
end
