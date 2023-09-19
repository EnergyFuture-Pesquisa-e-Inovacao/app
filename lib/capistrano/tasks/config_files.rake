namespace :config_files do
  desc 'Upload yml files inside config folder'
  task :upload do
    on roles(:app) do
      execute "mkdir -p #{shared_path}/app/config"

      upload! StringIO.new(File.read('config/database.yml')), "#{shared_path}/app/config/database.yml"
      upload! StringIO.new(File.read('config/application.rb')), "#{shared_path}/app/config/application.rb"
      upload! StringIO.new(File.read('config/master.key')), "#{shared_path}/app/config/master.key"
    end
  end
end