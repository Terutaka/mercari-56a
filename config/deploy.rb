lock "~> 3.11.0"
set :application, 'mercari-56a'
set :repo_url,  'git@github.com:Terutaka/mercari-56a.git'
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/mercari_key.pem']

set :linked_files, %w{config/master.key}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do

  task :restart do
    invoke 'unicorn:restart'
  end

  desc 'upload master.key'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/master.key', "#{shared_path}/config/master.key")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'
end

# set :default_env, {
# rbenv_root: "/usr/local/rbenv",
# path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
# AWS_ACCESS_KEY_ID: Rails.application.credentials.dig(:aws, :access_key_id),
# AWS_SECRET_ACCESS_KEY: Rails.application.credentials.dig(:aws, :secret_access_key),
# BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
# BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"],
# PAYJP_PRIVATE_KEY: ENV["PAYJP_PRIVATE_KEY"],
# PAYJP_KEY: ENV["PAYJP_KEY"]
# }
#

# namespace :deploy do
#   desc "reload the database with seed data"
#   task :seed do
#     run "cd /var/www/mercari-56a/current; rake db:seed RAILS_ENV=production"
#   end
# end


# rake db:seed RAILS_ENV=production

# set :rails_env, "production"
# set :unicorn_rack_env, "production"
