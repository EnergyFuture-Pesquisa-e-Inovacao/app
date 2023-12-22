class CreateLoginternoJob < ApplicationJob

queue_as :default

def perform(adminuserid,permissuser,funcao)
  @loginterno = Loginterno.new  
  @loginterno.data=Date.current
  @loginterno.hora=Time.current
  @loginterno.funcao=funcao
  @loginterno.datahora=DateTime.current
  @loginterno.adminuserid=adminuserid
  @loginterno.permissuser=permissuser
    if @loginterno.save
      return_success(funcao, adminuserid)
    end    
  rescue StandardError => e
    return_error(e)
end

  private

  def return_success(funcao, adminuserid)
    puts "Criado Loginterno com sucesso: #{adminuserid} (Nome: #{funcao})"
  end

  def return_error(e)
      puts "Erro ao Criar Loginterno: #{e.message}"
  end



end    