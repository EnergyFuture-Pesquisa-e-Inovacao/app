namespace :config_files do
  desc 'Upload yml files inside config folder'
  task :upload do
    on roles(:app) do
      execute "mkdir -p #{path}/app/config"

      upload! StringIO.new(File.read('config/database.yml')), "#{path}/config/database.yml"
      upload! StringIO.new(File.read('config/application.rb')), "#{path}/config/application.rb"
      upload! StringIO.new(File.read('config/master.key')), "#{path}/config/master.key"
    end
  end
end