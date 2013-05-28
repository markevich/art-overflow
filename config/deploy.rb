set :application, "artoverflow"
set :deploy_to, "/home/deployer/#{application}"
set :repository,  "git@github.com:markevich/art-overflow.git"

server "artoverflow.com", :app, :web, :db, primary: true

set :user, 'deployer'

set :use_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
