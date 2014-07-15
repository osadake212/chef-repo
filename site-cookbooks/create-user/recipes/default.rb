#
# Cookbook Name:: create-user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

accounts = data_bag('initial_accounts')

accounts.each do |account|
	item = data_bag_item('initial_accounts', account)

	# create a group
	group item['group']['name'] do
		gid item['group']['gid']
		action:create
	end

	# create a uesr
	user item['user']['name'] do
		home item['user']['home']
		password item['user']['password']
		shell item['user']['shell']
		gid item['user']['gid']
		supports :manage_home => true
		action :create
	end

end
