#execute "testing" do
#  command %Q{
#    echo "i ran at #{Time.now}" >> /root/cheftime
#  }
#end

require_recipe "dnapi"
require_recipe "postgres"

require_recipe "sunspot"