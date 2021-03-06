#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# checkout rbenv
git "/usr/local/src/rbenv" do
	repository "https://github.com/sstephenson/rbenv.git"
	revision "master"
	action :sync
  user node['user']['name']
  group node['group']['name']
	not_if { File.exist?("/usr/local/src/rbenv") }
end

# path configuration
template "/etc/profile.d/rbenv.sh" do
	mode 0755
end
