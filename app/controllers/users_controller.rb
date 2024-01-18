class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[ show ashowusers edit aedit update destroy resetpassword editp]
  #before_action :authenticate_user!, only: [:teste]
  #before_action :authenticate_admin!
  after_action :loginterno, only: %i[update create destroy resetpassword editp]

  def teste
  
  end  
  # GET /users or /users.json
  def index
    if verificauser
      @users = User.all.order(:name)
    else
      redirect_to '/users/sign_in'
    end   
  end

  # GET /users/1 or /users/1.json
  def show
    if verificauser  
      
    else
      redirect_to '/users/sign_in'
    end     
  end

  # GET /users/new
  def new
    if verificauser 
      @user = User.new
    else
      redirect_to '/users/sign_in' 
    end   
  end

  # GET /users/1/edit
  def edit
    if verificauser

    else
      redirect_to '/users/sign_in' 
    end  
  end

    # GET /users/1/edit
    def aedit
      if verificaadminteste
  
      else
        redirect_to '/users/sign_in' 
      end  
    end

    def adicionarprogramasetorialuser
      counteventos=0
      pidpg=params[:idpg]
      piduser=params[:iduser]
      programasetorial=Programasetorial.find(pidpg)
      user=User.find(piduser)
      @programasuser=Programasuser.new
      @programasuser.programasetorial_id=programasetorial.id
      @programasuser.user_id=user.id
      eventos=Evento.where(idobjeto:programasetorial.id,tipoobjeto:"Programa Setorial",status:"ativo")
      respond_to do |format|
       if @programasuser.save 
         eventos.each do |evento|
          eventosusers=Eventosuser.new
          eventosusers.evento_id=evento.id
          eventosusers.tipoobjeto="Programa Setorial"
          eventosusers.user_id=@programasuser.user_id
          if eventosusers.save
           counteventos=counteventos+1
          end 
         end 
         if eventos.count==counteventos
          format.html {redirect_to "/users/ashowusers?id=#{user.id}", notice: "User foi Editado com Sucesso!"}
         else
          eventosusers.each do |eventosuser|
           eventosuser.destroy
          end  
          @programasuser.destroy
          format.html { redirect_to "/users/ashowusers?id=#{user.id}", status: :unprocessable_entity }
         end 
        end 
      end
    end 

    def adicionaragendaeventouser
      pidag=params[:idag]
      piduser=params[:iduser]
      agenda=Agenda.find(pidag)
      user=User.find(piduser)
      evento=Evento.where(idobjeto:agenda.id,tipoobjeto:"Agenda",status:"ativo")
      respond_to do |format|
        eventosusers=Eventosuser.new
        eventosusers.evento_id=evento[0].id
        eventosusers.user_id=user.id
         if eventosusers.save
          format.html {redirect_to "/users/ashowusers?id=#{user.id}", notice: "User foi Editado com Sucesso!"}
         else
          format.html { redirect_to "/users/ashowusers?id=#{user.id}", status: :unprocessable_entity }
         end
      end
    end 

    def resetpassword
      if verificaadminteste  
        @user.password="441312"
        @user.password_confirmation=@user.password
        @user.primeirologin=true
        respond_to do |format|     
          if @user.save
           format.html {redirect_to "/users/ashowusers?id=#{@user.id}", notice: "Password foi Alterado com Sucesso!"}
           format.json { render :users, status: :ok, location: @user }
          else
           format.html { render :"/users/ashowusers?id=#{@user.id}", status: :unprocessable_entity }
           format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end      
      end
    end 

    # GET /users/1/editp
    def editp

      puts @user.id
      puts "DENTRO EDITP"
      #if verificauser and !verificaadmin
        #if current_user.usertype=="rhuser"
         
        #else  
        #  redirect_to '/users/sign_in'
        #end 
      #elsif !verificauser and verificaadmin
  
      #elsif !verificauser and !verificaadmin
      #  redirect_to '/users/sign_in' 
      #end  
    end

  # PATCH/PUT /users/1 or /users/1.json
  #def update
  #  respond_to do |format|
  #    if @user.update(user_params)
  #      #registrationupuser
  #      if current_admin.present?
  #       format.html {redirect_to "/users/ashowusers?id=#{@user.id}", notice: "User foi Editado com Sucesso!"}
  #       format.json { render :ashowusers, status: :ok, location: @user }
  #      elsif current_user.present?
  #       format.html {redirect_to "/home/agenda"}          
  #      end  
  #    else
  #      format.html { render :edit, status: :unprocessable_entity }
  #      format.json { render json: @user.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end


  def update
   if current_admin.present? 
    respond_to do |format|
      if @user.update(user_params)
        #registrationupuser
        NotifyRegistrationupuserJob.set(wait: 3.seconds).perform_later(@user)
         format.html {redirect_to "/users/ashowusers?id=#{@user.id}", notice: "User foi Editado com Sucesso!"}
         format.json { render :ashowusers, status: :ok, location: @user } 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
   elsif current_user.present?
    respond_to do |format|
      if params[:commit]=="Alterar a Senha"
        @user.primeirologin=false 
      end 
      if @user.update(user_params)
         #registrationupuser
         NotifyRegistrationupuserJob.set(wait: 3.seconds).perform_later(@user)
         format.html {redirect_to "/home/agenda"} 
         format.json { render :ashowusers, status: :ok, location: @user } 
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end    
   end  
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User foi Destruído com Sucesso!" }
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
      params.require(:user).permit(:email,:name,:phone,:empresa_id,:icp_id,:plano_id,:status,:password,:password_confirmation)
    end
    def programasuser_params
      params.require(:programasuser).permit(:programasetorial_id,:user_id)
    end  

  
end
