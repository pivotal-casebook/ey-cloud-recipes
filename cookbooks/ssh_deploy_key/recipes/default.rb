# Cookbook Name:: ssh_deploy_key
# Recipe:: default
application_hash = node[:applications].detect { |key, value| value.has_key?(:repository_name) }
repository_key = application_hash.last[:repository_name]
application = application_hash.first

if repository_parts = repository_key.match(/^(\w+:\/\/)?(\w+)@(.*):.*$/)
  config_file = File.directory?(File.join("/home", "username", ".ssh", "config"))
  username = node[:users].first[:username]
  
  repository_user = repository_parts[2]
  repository_host = repository_parts[3]
  
  execute "configure-ssh-to-use-deploy-key" do
    command %Q{
      cat <<-EOS >> #{config_file}

Host #{repository_host}
  User #{repository_user}
  Hostname #{repository_host}
  IdentityFile ~/.ssh/#{application}-deploy-key

EOS
    }
    not_if "grep 'IdentityFile ~/.ssh/#{application}-deploy-key' #{config_file}"
  end
else
  puts "no repository url found in #{application}! Contents are: #{node[:application].inspect}"
end
