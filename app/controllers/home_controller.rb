class HomeController < ApplicationController
  #before_action :authenticated!
  def index
  end

  def propdi
  end

  def academy
  end

  def respostapropdi
    puts params
  end

  def respostaacademy
    puts params
  end

  def respostafeedinovacao
    puts params
  end

  def respostaradardesafios
    puts params
  end

  def agenda
    @eventos=Evento.where(tipoobjeto:"Agenda").order(Arel.sql('datainicio ASC'))
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

  def profiletimeline
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
    if evento.present?
      timeline=Timeline.where(idobjeto:evento[0].id,tipoobjeto:tipoevento,user_id:current_user.id)
      if !timeline.present?
        timeline=Timeline.create
        timeline.tipoobjeto=tipoevento
        timeline.idobjeto=evento[0].id
        timeline.user_id=current_user.id
        timeline.status=evento[0].status
        thdi = evento[0].datainicio
        thi = evento[0].horainicio
        timeline.datahora=thdi.strftime("%d/%m/%Y")+" "+thi.strftime('%H:%M')
        if timeline.save!
          if params[:tipoobjeto]=="Agenda"
            respond_to do |format|
              format.html { redirect_to "/home/agenda", notice: "Estou Participando do Evento." }
              format.json { head :no_content }
            end
          elsif params[:tipoobjeto]=="Programa Setorial"
            respond_to do |format|
              format.html { redirect_to "/home/profiletimeline/?id=#{evento[0].idobjeto}", notice: "Estou Participando do Evento." }
              format.json { head :no_content }
            end
          end  
        end   
      end  
    end
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