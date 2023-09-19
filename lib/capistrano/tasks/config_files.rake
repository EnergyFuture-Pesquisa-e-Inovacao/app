namespace :config_files do
  desc 'Upload yml files inside config folder'
  task :upload do
    on roles(:app) do
      execute "mkdir -p shared/app/config"

      upload! StringIO.new(File.read('config/database.yml')), "shared/app/config/database.yml"
      upload! StringIO.new(File.read('config/application.rb')), "shared/app/config/application.rb"
      upload! StringIO.new(File.read('config/master.key')), "shared/app/config/master.key"
    end
  end
end