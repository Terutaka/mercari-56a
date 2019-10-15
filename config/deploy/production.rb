server '18.176.12.2',
  user: "ec2-user",
  roles: %w{app db web},
  ssh_options: {
    port: 22,
    user: "ec2-user",
    keys: %w(~/.ssh/mercari_key.pem),
    forward_agent: true
  }

set :rails_env, "production"
set :unicorn_rack_env, "production"
