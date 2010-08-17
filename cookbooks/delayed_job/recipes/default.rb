#
# Cookbook Name:: delayed_job
# Recipe:: default
#

node[:applications].each do |app_name,data|

  ey_cloud_report "delayed_job" do
    message "Deploying delayed::job for #{app_name}"
  end

  template "/etc/monit.d/delayed_job.#{app_name}.monitrc" do
    source "dj.monitrc.erb"
    owner "root"
    group "root"
    mode 0644
    variables({
      :app_name => app_name,
      :user => node[:owner_name],
      :worker_name => "delayed_job",
      :framework_env => node[:environment][:framework_env]
    })
  end
  
  execute "monit-reload-restart" do
     command "sleep 30 && monit quit"
     action :run
  end
    
end