#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'httpd'

file '/var/www/html/index.html' do
  content '<h1>Welcome home!</h1>'
end

httpd_vhost 'admins' do
  action :create
end

service 'httpd' do
  action [:enable, :start]
end
