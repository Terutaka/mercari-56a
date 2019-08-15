lock "~> 3.11.0"
set :application, 'mercari-56a'
set :repo_url,  'git@github.com:maruchan76/mercari-56a.git'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
end

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"],
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"],
  PAYJP_PRIVATE_KEY: ENV["PAYJP_PRIVATE_KEY"],
  PAYJP_KEY: ENV["PAYJP_KEY"]
}
set :linked_files, fetch(:linked_files, []).push("config/master.key")

# namespace :deploy do
#   desc "reload the database with seed data"
#   task :seed do
#     run "cd /var/www/mercari-56a/current; rake db:seed RAILS_ENV=production"
#   end
# end


# rake db:seed RAILS_ENV=production

# set :rails_env, "production"
# set :unicorn_rack_env, "production"