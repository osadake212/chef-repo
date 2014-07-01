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

	# create groups
	item['groups'].each do |group|
		group group['name'] do
			gid group['gid']
			action:create
		end
	end

	# create uesr
	user item['user']['name'] do
		home item['user']['home']
		shell item['user']['shell']
		gid item['user']['gid']
		supports :manage_home => true
		action :create
	end

end
