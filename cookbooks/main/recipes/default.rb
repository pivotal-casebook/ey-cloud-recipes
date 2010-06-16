#execute "testing" do
#  command %Q{
#    echo "i ran at #{Time.now}" >> /root/cheftime
#  }
#end

require_recipe "postgres::default"
require_recipe "sunspot"
require_recipe "apache-ant"
require_recipe "prince"