#
#  Create symlink 'localtime' which points
#  to the UTC timezone in order to configure
#  the server to use UTC
# 
link "/etc/localtime" do
  to "/usr/share/zoneinfo/UTC"
end