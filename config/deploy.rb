set :application, "wohnungssucherportal"
set :repository,  "git@github.com:phillipoertel/wohnungssucherportal.git"

set :scm, :git
set :use_sudo, true
set :deploy_via, :remote_cache

role :web, "87.106.19.63" # Your HTTP server, Apache/etc
role :app, "87.106.19.63" # This may be the same as your `Web` server
role :db,  "87.106.19.63" # This is where Rails migrations will run

namespace :deploy do
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  desc "Ensure www-data has the permissions for the files it needs"
  task :ensure_permissions do
    chown_these = %w(config/environment.rb tmp).map { |f| File.join(current_path, f) }
    run "chown -R www-data:www-data #{chown_these.join(' ')}"
  end
  
  desc "Copy configuration files from shared into new release release"
  task :copy_config do
    run "cp #{shared_path}/config/database.yml #{current_path}/config/"
  end

end

before "deploy:symlink", "deploy:ensure_permissions"
after "deploy:symlink", "deploy:copy_config"
before "deploy:migrate", "deploy:copy_config"

