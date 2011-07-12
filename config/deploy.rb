set :application, "wohnungssucherportal"
set :repository,  "git@github.com:phillipoertel/wohnungssucherportal.git"

set :scm, :git
set :use_sudo, true
set :deploy_via, :remote_cache

role :web, "87.106.19.63" # Your HTTP server, Apache/etc
role :app, "87.106.19.63" # This may be the same as your `Web` server
role :db,  "87.106.19.63", :primary => true # This is where Rails migrations will run

namespace :deploy do
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  desc "Ensure required directories exist"
  task :ensure_directories do
    path = File.join(current_path, 'tmp')
    run "mkdir -p #{path}"
  end
  
  desc "Ensure www-data has the permissions for the files it needs"
  task :ensure_permissions do
    chown_these = %w(config/environment.rb tmp).map { |f| File.join(current_path, f) }
    sudo "chown -R www-data:www-data #{chown_these.join(' ')}"
  end
  
  desc "Copy configuration files from shared into new release release"
  task :copy_config, :except => { :no_release => true } do
    #run "cp #{shared_path}/config/database.yml #{current_path}/config/"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

end

#namespace :release do
#  desc "Do a full release from local"
#  task :rspec do
#    ``
#  end
#  
#  task :default => [:rspec, :push, :"deploy:migrations"]
#end

before "deploy:symlink", "deploy:ensure_directories"
before "deploy:symlink", "deploy:ensure_permissions"
after "deploy:finalize_update", "deploy:copy_config"

# have builder check and install gems after each update_code
require 'bundler/capistrano'
after "deploy:rollback:revision", "bundler:install"