#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user = ""
group = ""

accounts = data_bag('initial_accounts')

accounts.each do |account|
  item = data_bag_item('initial_accounts', account)
  user = item['user']['name']
  group = item['group']['name']
end

# checkout rbenv
git "/usr/local/src/rbenv" do
	repository "https://github.com/sstephenson/rbenv.git"
	revision "master"
	action :sync
  user user
  group group
	not_if { File.exist?("/usr/local/src/rbenv") }
end

# path configuration
template "/etc/profile.d/rbenv.sh" do
	mode 0755
end
