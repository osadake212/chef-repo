#
# Cookbook Name:: install-packages
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{gcc make zlib-devel perl-ExtUtils-MakeMaker httpd httpd-devel openssl-devel libyaml-devel libxml2-devel libxslt-devel libffi-devel readline-devel pcre-devel sqlite-devel mysql mysql-server mysql-devel curl-devel nkf git}.each do |pkg|
	package pkg do
		options "-y"
		action :install
	end
end
