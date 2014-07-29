#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install nginx
package "nginx" do
  action :install
end

# register service
service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end

# nginx settings
template "nginx.conf" do
  owner "root"
  group "root"
  mode 0644
  path "/etc/nginx/nginx.conf"

  notifies :reload, "service[nginx]"
end
