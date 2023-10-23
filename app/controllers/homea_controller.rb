class HomeaController < ApplicationController
  before_action :set_user, only: [:showusers, :edituser]
  before_action :authenticate_user!, only: [:show]

  # GET /icps or /icps.json
  def index
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
     
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  def adicionareventops
    p=params[:idpg]
     @programasetorial=Programasetorial.find(p)
     @evento = Evento.new
     @evento.tipoobjeto="Programa Setorial"
     @evento.idobjeto=@programasetorial.id 
  end  

    # GET /icps or /icps.json
    def indexeventosps
      if verificauser and !verificaadmin
        redirect_to '/users/sign_in'
      elsif !verificauser and verificaadmin
       @eventos=Evento.where(tipoobjeto:"Programa Setorial")
      elsif !verificauser and !verificaadmin
        redirect_to '/users/sign_in'
      end   
    end

  def showusers  
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
     
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  def editusers  
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin
     
    elsif !verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    end   
  end

  def users
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin 
      @users = User.all
    end  
  end

    # PATCH/PUT /users/1 or /users/1.json
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
          #update_userz
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end 
      end
    end

  private

  def user_params
    params.require(:user).permit(:email,:name,:phone,:empresa_id,:icp_id,:plano_id)
  end

  def set_user
    @user = User.find(params[:id])
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
