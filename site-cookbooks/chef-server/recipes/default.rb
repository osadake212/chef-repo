#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

RPM_FILE_NAME = 'chef-server-11.1.3-1.el6.x86_64.rpm'
PATH_USER_LOCAL_RPM = "/usr/local/rpm"
PATH_RPM = "#{PATH_USER_LOCAL_RPM}/#{RPM_FILE_NAME}"

# create rpm dir
directory "#{PATH_USER_LOCAL_RPM}" do
  action :create
  not_if { File.exists?(PATH_USER_LOCAL_RPM) }
end

# copy rpm file
cookbook_file "#{RPM_FILE_NAME}" do
  path PATH_RPM
  not_if { File.exists?(PATH_RPM) }
end

# install rpm file
package "chef-server" do
  provider Chef::Provider::Package::Rpm
  source PATH_RPM
  notifies :run, "execute[chef-server configure]"
end

# configure chef-server
execute "chef-server configure" do
  user "root"
  command "chef-server-ctl reconfigure"
  action :nothing

  notifies :disable, "service[iptables]"
end

# stop iptables
# don't execute product environment
service "iptables" do
  action [:stop, :disable]
end
