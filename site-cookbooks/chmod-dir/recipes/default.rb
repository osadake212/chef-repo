#
# Cookbook Name:: chmod-dir
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
accounts = data_bag('initial_accounts')

group_name = ""
accounts.each do |account|
  item = data_bag_item('initial_accounts', account)
  group_name = item['group']['name']
end

# change permission
execute "/usr/local/src permission" do
	command "chmod 0775 /usr/local/src"
	user "root"
	action :run
end

# change owner group
execute "/usr/local/src owner" do
  command "chown -R :#{group_name} /usr/local/src"
  action :run
end
