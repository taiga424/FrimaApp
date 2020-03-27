lock '3.12.0'
set :application, 'FrimaApp'
set :repo_url,  'git@github.com:taiga424/FrimaApp.git'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/ChatSpace.pem']
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    # unicornを完全にキルしてから再起動する
    invoke 'unicorn:stop'
    invoke 'unicorn:start'
  end
  after :finishing, 'deploy:cleanup'
end