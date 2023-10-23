class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[ show ashowusers edit aedit update destroy ]
  before_action :authenticate_user!, only: [:teste]
  before_action :authenticate_admin!

  def teste
  
  end  
  # GET /users or /users.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @users = User.all
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  # GET /users/1 or /users/1.json
  def show
    if verificauser and !verificaadmin

    elsif !verificauser and verificaadmin   
      
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end     
  end

  # GET /users/new
  def new
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
      @user = User.new
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /users/1/edit
  def edit
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin

    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in' 
    end  
  end

    # GET /users/1/edit
    def aedit
      if verificauser and !verificaadmin
        redirect_to '/users/sign_in'
      elsif !verificauser and verificaadmin
  
      elsif !verificauser and !verificaadmin
        redirect_to '/users/sign_in' 
      end  
    end

  # POST /users or /users.json
  #def create
  #  @user = User.new(user_params)
  #  respond_to do |format|
  #    if @user.save
        #notify_registrationuser("create")
  #      format.html { redirect_to user_url(@user), notice: "User was successfully created." }
  #      format.json { render :show, status: :created, location: @user }
 #     else
  #      format.html { render :new, status: :unprocessable_entity }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        registrationupuser
        format.html {redirect_to "/users/ashowusers?id=#{@user.id}", notice: "User was successfully updated."}
        format.json { render :ashowusers, status: :ok, location: @user }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email,:name,:phone,:empresa_id,:icp_id,:plano_id,:status)
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
