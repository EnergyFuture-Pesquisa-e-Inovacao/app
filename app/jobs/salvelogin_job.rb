class SalveloginJob < ApplicationJob

queue_as :default

def perform(userid)
  user=User.find(userid)
  user.ultimologin=Date.current
  if user.countlogin.present?
    user.countlogin=user.countlogin+1
  else
     user.countlogin=1
  end  
    if user.save
      return_success(userid)
    end    
  rescue StandardError => e
    return_error(e)
end

  private

  def return_success(userid)
    puts "Criado SalveLogin com sucesso: #{userid})"
  end

  def return_error(e)
      puts "Erro ao Criar SalveLogin: #{e.message}"
  end



end    