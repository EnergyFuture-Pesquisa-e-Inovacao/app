require 'rubygems'
require 'zapier_ruby'
ZapierRuby.configure do |c|
    #c.web_hooks = {user_logou: "10142775/39vrf61"}

    
    # For new web hooks, you must provide this param
    #c.account_id = "10142775" # Get this from the first part of your webhook URI
  
    # For older webhooks, you should override the base uri to the old uri
    #c.base_uri = "https://hooks.zapier.com/hooks/catch/"


    
    # For new web hooks, you must provide this param
    c.account_id = "10142775" # Get this from the first part of your webhook URI
  
    # For older webhooks, you should override the base uri to the old uri
    c.base_uri = "https://hooks.zapier.com/hooks/catch/"   




end

#ZapierRuby.configure do |d|
#    d.web_hooks = {update_userz2: "10142775/39nn3b0"}
#end