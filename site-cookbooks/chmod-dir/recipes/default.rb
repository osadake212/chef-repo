#
# Cookbook Name:: chmod-dir
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "/usr/local/src permission" do
	command "chmod 0777 /usr/local/src"
	user "root"
	action :run
end
