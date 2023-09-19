# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

set :application, "app"
set :repo_url, "git@github.com:RogerioLira/app.git"
set :branch, "main"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
 #set :deploy_to, "/var/www/app"
 set :deploy_to, "/home/deploy/#{fetch :application}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w[config/application.rb config/database.yml config/master.key]

# Default value for linked_dirs is []
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle .bundle public/system public/uploads node_modules]

# Skip migration if files in db/migrate were not modified
# Defaults to false
set :conditionally_migrate, true

# ================================================
# ============ From Custom Rake Tasks ============
# ================================================
# ===== See Inside: lib/capistrano/tasks =========
# ================================================

# upload configuration files
before 'deploy:starting', 'config_files:upload'

set :initial, true

# run only if app is being deployed for the very first time, should update "set :initial, true" above to run this
before 'deploy:migrate', 'database:create' if fetch(:initial)

# reload application after successful deploy
after 'deploy:publishing', 'application:reload'
