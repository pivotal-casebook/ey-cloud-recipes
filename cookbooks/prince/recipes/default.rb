# Cookbook Name:: prince
# Recipe:: default

package_tgz = "prince-7.1-linux.tar.gz"
package_folder = package_tgz.gsub('.tar.gz', '')

execute "install-prince" do
  command %Q{
    curl -O http://www.princexml.com/download/#{package_tgz} &&
    tar zxvf #{package_tgz} &&
    mv #{package_folder}/lib/prince /usr/local/prince &&
    rm #{package_tgz}
  }
  not_if { File.directory?('/usr/local/prince') }
end

execute "add-to-path" do
  command %Q{
    echo 'export PATH=$PATH:/usr/local/prince/bin' >> /etc/profile
  }
  not_if "grep 'export PATH=$PATH:/usr/local/prince/bin' /etc/profile"
end
