#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'httpd'

httpd_vhost 'welcome' do
  site_name 'welcome'
  action :remove
end

httpd_vhost 'users' do
  site_port 80
  site_name 'users'
  action :create
end

httpd_vhost 'admins' do
  notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:enable, :start]
end
