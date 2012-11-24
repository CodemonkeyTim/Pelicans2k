set :application, "Pelicans2k"
set :repository,  "git@github.com:CodemonkeyTim/Pelicans2k.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :user, "teemu"  # The server's user for deploys
set :scm_passphrase, "Tvaini0"  # The deploy user's password

set :deploy_to, "/home/teemu/rails/deployments"

default_run_options[:pty] = true

role :web, "192.168.0.14"                          # Your HTTP server, Apache/etc
role :app, "192.168.0.14"                          # This may be the same as your `Web` server
role :db,  "192.168.0.14", :primary => true # This is where Rails migrations will run



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