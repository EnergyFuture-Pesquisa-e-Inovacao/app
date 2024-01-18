class HomeController < ApplicationController
  #before_action :authenticated!
  #before_action :authenticate_user!
  include HomeHelper
  def index
   
     #if current_user.primeirologin
       #redirect_to "/users/editp/?id=#{current_user.id}", allow_other_host: true
     #else  
      # SalveloginJob.set(wait: 2.seconds).perform_later(current_user.id)
     #end  
  end

  def propdi
  end

  def academy
  end

  def respostapropdi
    notify_registrationresppropdi(current_user.id,current_user.name,getresppropdi(params[:id]))
    respond_to do |format|
      format.html { redirect_to "/home/propdi", notice: "Muito obrigado pela sua resposta." }
      format.json { head :no_content }
    end  
  end

  def respostaacademy
    notify_registrationrespacademy(current_user.id,current_user.name,getrespacademy(params[:id]))
    respond_to do |format|
      format.html { redirect_to "/home/academy", notice: "Muito obrigado pela sua resposta." }
      format.json { head :no_content }
    end  
  end

  def respostafeedinovacao
    puts params
  end

  def respostaradardesafios
    puts params
  end

  def agenda
    puts "Teste"
    if verificauser
     if current_user.present?
      if current_user.primeirologin?
       redirect_to "/users/editp/?id=#{current_user.id}", allow_other_host: true
      else  
       SalveloginJob.set(wait: 2.seconds).perform_later(current_user.id)
       @eventosrec=Evento.where(tipoobjeto:"Agenda",status:"ativo").limit(8).order(Arel.sql('datainicio ASC'))
       @eventosant=Evento.where(tipoobjeto:"Agenda",status:"inativo").limit(4).order(Arel.sql('datainicio ASC'))
      end  
     end 
    else
      redirect_to '/users/sign_in'
    end  
  end

#  def participaracademy
#    academy = Academy.find(params[:id])
#    agenda = Agenda.where(idevento:academy.id).where(tipoevento:"Academy")
#    academiesparticipante=Academiesparticipante.where(academy_id:academy.id).where(user_id:current_user.id)
#    if !academiesparticipante.present?
#      academiesparticipante=Academiesparticipante.create
#      academiesparticipante.academy_id=academy.id
#      academiesparticipante.user_id=current_user.id

#      eventosparticipante=Eventosparticipante.create
#      eventosparticipante.user_id=current_user.id
#      eventosparticipante.idevento=academy.id
#      eventosparticipante.agenda_id=agenda[0].id
#      eventosparticipante.foienviado=false

#      if academiesparticipante.save! and eventosparticipante.save! 
#       respond_to do |format|
#        format.html { redirect_to "/home/academies", notice: "Participando do Academy." }
#        format.json { head :no_content }
#       end
#      else
#       respond_to do |format|
#        format.html { redirect_to "/home/academies", notice: "falha1." }
#        format.json { head :no_content }
#       end 
#      end  
#    else
#      respond_to do |format|
#        format.html { redirect_to "/home/academies", notice: "falha2." }
#        format.json { head :no_content }
#     end   
#   end 
#  end

  #def academies
  #  @agendasid = Agenda.select(:idevento).where(tipoevento: "Academy").where(status: "ativo").order(:datainiciom1)
  #  @academies = Academy.where(id:@agendasid)
  #end

  def ctaprogramasetorial1
    puts "LINK FUNCIONOU"
    puts params[:id]
    respond_to do |format|
      format.html { redirect_to "/home/programasetorials", notice: "Participando do Programa." }
      format.json { head :no_content }
     end    
  end  

  def participarprogramasetorial
    programasetorial = Programasetorial.find(params[:id])
    eventos = Evento.where(idobjeto:programasetorial.id,tipoobjeto:"Programa Setorial")
    programasuser=Programasuser.where(programasetorial_id:programasetorial.id,user_id:current_user.id)
    if !programasuser.present?
      programasuser=Programasuser.create
      programasuser.programasetorial_id=programasetorial.id
      programasuser.user_id=current_user.id
      counteventosparticipante=0
      if eventos!=[]
        eventos.each do |i, evento|
          eventosparticipante=Eventosparticipante.create
          eventosparticipante.user_id=current_user.id
          eventosparticipante.idobjeto=programasetorial.id
          eventosparticipante.eventoid=evento.id
          eventosparticipante.tipoobjeto=evento.tipoobjeto
          eventosparticipante.idobjeto=evento.idobjeto
          eventosparticipante.foienviado=false
          eventosparticipante.save
          counteventosparticipante=counteventosparticipante+1
        end  
      end
      #if counteventosparticipante=!0 e eventos.count
      if programasuser.save! 
       respond_to do |format|
        format.html { redirect_to "/home/programasetorials", notice: "Participando do Programa." }
        format.json { head :no_content }
       end
      else
       respond_to do |format|
        format.html { redirect_to "/home/programasetorials", notice: "falha1." }
        format.json { head :no_content }
       end 
      end  
    else
      respond_to do |format|
        format.html { redirect_to "/home/programasetorials", notice: "falha2." }
        format.json { head :no_content }
      end   
   end 
  end

  def programasetorials
    @programasetorials = Programasetorial.where(status: "ativo") 
  end

  def basesetorial
  end

  def radardesafios
  end

  def feedinovacao
  end

  def feeda
    
  end

  def programatimeline
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end  

  def programainfo
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end  

  def programaparticipantes
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end  

  def programaeventos
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end  

  def programaarquivos
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end  

  def programapropostas
    @programasetorial = Programasetorial.find(params[:id])
    @eventos = Evento.where(idobjeto:@programasetorial.id,tipoobjeto:"Programa Setorial")
    @programausers=Programasuser.where(programasetorial_id:@programasetorial.id)
  end 
  
  def participarevento
    evento=Evento.where(id:params[:id],tipoobjeto:params[:tipoobjeto])
    if params[:tipoobjeto]=="Agenda"
     tipoevento="Eventos Agenda"
    elsif params[:tipoobjeto]=="Programa Setorial"
     tipoevento="Eventos PG"
    end
    timeline=Timeline.where(idobjeto:evento[0].id,tipoobjeto:tipoevento)
    eventosuser=Eventosuser.where(evento_id:evento[0].id,user_id:current_user.id,tipoobjeto:params[:tipoobjeto])
    if !eventosuser.present? 
      if criaeventouser(evento[0].id,params[:tipoobjeto],current_user.id) 
        if tipoevento=="Eventos Agenda"
          respond_to do |format|
            format.html { redirect_to "/home/agenda", notice: "Estou Participando do Evento." }
            format.json { head :no_content }
          end
        elsif tipoevento=="Eventos PG"
          respond_to do |format|
            format.html { redirect_to "/home/programatimeline/?id=#{evento[0].idobjeto}", notice: "Estou Participando do Evento." }
            format.json { head :no_content }
         end
        end
      end#falta resposta   
    end#falta resposta    
  end  
 
  def criaeventouser(eventoid,ptipoobjeto,userid)
    eventosuser=Eventosuser.new
    eventosuser.evento_id=eventoid
    eventosuser.tipoobjeto=ptipoobjeto
    eventosuser.user_id=userid
    eventosuser.save
  end  

  #def resource_name
 #   :user
 # end

 # def resource
 #   @resource ||= User.new
 # end

 # def devise_mapping
 #   @devise_mapping ||= Devise.mappings[:user]
 # end

end
