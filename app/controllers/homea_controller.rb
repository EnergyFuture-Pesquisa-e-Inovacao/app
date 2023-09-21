class HomeaController < ApplicationController
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
    p=params[":id"]
     programasetorial=Programasetorial.where(id:p)
     @programasetorial=Programasetorial.find(programasetorial[0].id)
     evento=Evento.new
     evento.tipoobjeto="Programa Setorial"
     evento.idobjeto=@programasetorial.id
     respond_to do |format|
      format.html { redirect_to "/eventos/new", notice: "." }
     end   
  end  

  

  def users
    if verificauser and !verificaadmin
      redirect_to '/users/sign_in'
    elsif !verificauser and verificaadmin 
      @users = User.all
    end  
  end

  private

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