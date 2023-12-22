class LoginternosController < ApplicationController
  before_action :set_logininterno, only: %i[show]


  def index
    if verificaadminteste
     @q = Loginterno.ransack(params[:q])
     @loginternos = @q.result.page(params[:page]).order(data: :desc,hora: :desc)  
    else
      redirect_to '/users/sign_in'
    end  
  end




  def show; 
   if verificaadminteste

   else
    redirect_to '/users/sign_in'
   end
  end







  private

  def countsloginternos
    loginternos=Loginterno.all
    loginternos.count
  end  

  def set_loginterno
    @loginterno = Loginterno.find(params[:id])
  end


end
