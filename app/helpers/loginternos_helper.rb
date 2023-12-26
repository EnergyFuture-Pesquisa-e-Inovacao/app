module LoginternosHelper
    
def getemailadminuser(permissuser,adminuserid)
  if permissuser==1
    User.find(adminuserid).email
  elsif permissuser==0
    Admin.find(adminuserid).email 
  end  
end

  


end
