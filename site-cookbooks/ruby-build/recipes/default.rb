#
# Cookbook Name:: ruby-build
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/usr/local/src/rbenv/plugins" do
	mode "0755"
	action :create
end

git "/usr/local/src/rbenv/plugins/ruby-build" do
	repository "git://github.com/sstephenson/ruby-build.git"
	reference "master"
	action :checkout
end

execute "ruby install" do
	not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep 2.0.0-p451"
	command "source /etc/profile.d/rbenv.sh; rbenv install 2.0.0-p451"
	action :run
end

execute "ruby change" do
	command "source /etc/profile.d/rbenv.sh; rbenv global 2.0.0-p451; rbenv rehash"
	action :run
end
