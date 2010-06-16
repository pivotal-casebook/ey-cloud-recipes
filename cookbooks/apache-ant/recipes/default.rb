# Cookbook Name:: apache-ant
# Recipe:: default

execute "install-apache-ant" do
  command %Q{
    curl -O http://www.apache.org/dist/ant/ant-current-bin.zip &&
    unzip -o ant-current-bin.zip && mv apache-ant-* /usr/local/apache-ant
    rm ant-current-bin.zip
  }
  not_if { File.directory?('/usr/local/apache-ant') }
end

execute "add-to-path" do
  command %Q{
    echo 'export PATH=$PATH:/usr/local/apache-ant/bin' >> /etc/profile
  }
  not_if "grep 'export PATH=$PATH:/usr/local/apache-ant/bin' /etc/profile"
end
