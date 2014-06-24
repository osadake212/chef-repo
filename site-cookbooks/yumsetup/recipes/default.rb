#
# Cookbook Name:: yumsetup
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# copy epel rpm file
cookbook_file "yum-epel.rpm" do
	source "epel-release-6-8.noarch.rpm"
	path "/usr/local/src/epel-release-6-8.noarch.rpm"
	not_if { File.exists?('usr/local/src/epel-release-6-8.noarch.rpm') }
end

# add epel repo
execute "yum-epel-rpm" do
	user "root"
	command "rpm -ivh /usr/local/src/epel-release-6-8.noarch.rpm"
	action :run
	not_if { File.exists?('/etc/yum.repos.d/epel.repo') }
end

yum_package "yum-fastestmirror" do
	action :install
end

execute "yum-update" do
	user "root"
	command "yum -y update"
	action :run
end
