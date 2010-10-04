# Cookbook Name:: prince
# Recipe:: default

package_tgz = "prince-7.1-linux.tar.gz"
package_folder = package_tgz.gsub('.tar.gz', '')

execute "install-prince" do
  command %Q{
    curl -O http://www.princexml.com/download/#{package_tgz} &&
    tar zxvf #{package_tgz} &&
    sudo #{package_folder}/install.sh &&
    rm #{package_tgz}
  }
  not_if { File.exists?('/usr/local/bin/prince') }
end

execute "add-to-path" do
  command %Q{
    echo 'export PATH=$PATH:/usr/local/bin' >> /etc/profile
  }
  not_if "grep 'export PATH=$PATH:/usr/local/bin' /etc/profile"
end
