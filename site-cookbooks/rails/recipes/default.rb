#
# Cookbook Name:: rails
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# install rails
gem_package "rails" do
	action :install
	options "--no-ri --no-rdoc"
end
