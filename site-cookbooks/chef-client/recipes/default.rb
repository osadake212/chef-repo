#
# Cookbook Name:: chef-client
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# execut command for installing chef-client
execute "install chef-client" do
  command "sudo true && curl -L https://www.opscode.com/chef/install.sh | sudo bash"
  action :run
  not_if "which chef-client"
end
