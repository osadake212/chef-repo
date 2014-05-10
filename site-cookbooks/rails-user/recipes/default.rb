#
# Cookbook Name:: rails-user
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
group 'rails' do
  group_name 'rails'
  action     :create
end

user 'rails' do
  comment  'rails'
  group    'rails'
  home     '/home/rails'
  shell    '/bin/bash'
  password nil
  supports :manage_home => true
  action   :create
end