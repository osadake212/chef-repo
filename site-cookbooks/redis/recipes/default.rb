#
# Cookbook Name:: redis
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

FILE_NAME = 'redis-2.6.9'
FILE_NAME_TAR = "#{FILE_NAME}.tar.gz"
PATH_USER_LOCAL_SRC = '/usr/local/src'

# create dir
directory "#{PATH_USER_LOCAL_SRC}" do
  mode 0755
  action :create
  not_if { File.exists?(PATH_USER_LOCAL_SRC) }
end

# copy file
cookbook_file "#{PATH_USER_LOCAL_SRC}/#{FILE_NAME_TAR}" do
  source FILE_NAME_TAR
  not_if { File.exists?("#{PATH_USER_LOCAL_SRC}/#{FILE_NAME_TAR}") }

  notifies :run, "bash[make and install redis]", :immediately
end

# install redis
bash 'make and install redis' do
  action :nothing
  code <<-EOH
    cd #{PATH_USER_LOCAL_SRC}
    tar zxvf #{FILE_NAME_TAR}
    cd #{FILE_NAME}
    make test
    make
    sudo make install
  EOH
  not_if 'which redis-server'
end
