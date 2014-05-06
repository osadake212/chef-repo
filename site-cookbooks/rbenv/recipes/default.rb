#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/usr/local/rbenv" do
	repository "git://github.com/sstephenson/rbenv.git"
	reference "master"
	action :checkout
	group "devel"
end

directory "/usr/local/rbenv/plugins" do
	group "rbenv"
	mode "0755"
	action :create
end