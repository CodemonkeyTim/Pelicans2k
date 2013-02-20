set :application, "Pelicans2k"
set :repository,  "git@github.com:CodemonkeyTim/Pelicans2k.git"

set :scm, :git
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

ssh_options[:forward_agent] = true

#set :user, "root"  # The server's user for deploys
#set :scm_passphrase, "Jd386Jma354y"  # The deploy user's password
set :user, "teme"  # The server's user for deploys
set :scm_passphrase, "Tvaini0"  # The deploy user's password

#set :deploy_to, "/root/rails"
set :deploy_to, "/home/teme/rails/deployments"

default_run_options[:pty] = true

#role :web, "178.251.154.93"                          # Your HTTP server, Apache/etc
#role :app, "178.251.154.93"                          # This may be the same as your `Web` server
#role :db,  "178.251.154.93", :primary => true        # This is where Rails migrations will run

role :web, "pelicans2k.ddns.net"                          # Your HTTP server, Apache/etc
role :app, "pelicans2k.ddns.net"                          # This may be the same as your `Web` server
role :db,  "pelicans2k.ddns.net", :primary => true        # This is where Rails migrations will run


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end