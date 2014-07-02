#
# Cookbook Name:: x-window
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

accounts = data_bag('initial_accounts')

accounts.each do |account|
	item = data_bag_item('initial_accounts', account)
	login_user = item['user']['name']
end

# install desktop
execute "install_xwndow" do
	command 'yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts"'
	notifies :run, "execute[japanese_support]", :immediately
	not_if "yum grouplist | grep -i 'x window system'"
end

# japanese
execute "japanese_support" do
	command 'yum -y groupinstall "Japanese Support"'
	action :nothing
	notifies :touch, "template[/etc/sysconfig/i18n]", :immediately
end

# set config
template '/etc/sysconfig/i18n' do
	source 'centos-ja.erb'
	action :nothing
	notifies :run, "execute[start_xwindow]"
end

# change run level
execute "change run level" do
	command 'sed -i "s/id:3:initdefault:/id:5:initdefault:/g" /etc/inittab'
	action :nothing
end

# start  x window
execute "start xwindow" do
	command 'startx'
	user "#{login_user}"
	action :nothing
end
