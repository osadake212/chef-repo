#
# Cookbook Name:: yumsetup
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

FILE_NAME_EPEL_RPM = 'epel-release-6-8.noarch.rpm'
PATH_USER_LOCAL = '/usr/local/src'
PATH_EPEL_RPM = "#{PATH_USER_LOCAL}/#{FILE_NAME_EPEL_RPM}"

# copy epel rpm file
cookbook_file "yum-epel.rpm" do
	source FILE_NAME_EPEL_RPM
	path PATH_EPEL_RPM
	not_if { File.exists?(PATH_EPEL_RPM) }
end

# add epel repo
execute "yum-epel-rpm" do
	user "root"
	command "rpm -ivh #{PATH_EPEL_RPM}"
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
