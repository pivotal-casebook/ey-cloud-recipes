#execute "testing" do
#  command %Q{
#    echo "i ran at #{Time.now}" >> /root/cheftime
#  }
#end

require_recipe "ssh_deploy_key"
require_recipe "postgres::default"
require_recipe "sunspot"
require_recipe "prince"
