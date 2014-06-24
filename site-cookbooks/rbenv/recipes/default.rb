#
# Cookbook Name:: rbenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/usr/local/src/rbenv" do
	repository "https://github.com/sstephenson/rbenv.git"
	reference "master"
	action :checkout
	group "devel"
	not_if { File.exist?("/usr/local/src/rbenv") }
end
