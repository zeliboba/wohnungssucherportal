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
end