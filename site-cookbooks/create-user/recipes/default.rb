#
# Cookbook Name:: create-user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

account = data_bag('user')

account.each do |id|

	item = data_bag_item('user', id)

	# create groups
	item['groups'].each do |g|
		group g['name'] do
			gid g['gid']
			action :create
		end
	end

	# create users
	item['users'].each do |u|
		user u['name'] do
			home u['home']
			password u['password']
			shell u['shell']
			uid u['uid']
			gid u['gid']
			supports :manage_home => true
			action :create
		end
	end

end
