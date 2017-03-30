
action :create do
  directory '/srv/apache/admins/html' do
    recursive true
    mode '0755'
  end

  directory '/etc/httpd/conf/d' do
    recursive true
    mode '0755'
  end

  template '/etc/httpd/conf/d/admins.conf' do
    source 'conf.erb'
    mode '0644'
    variables(document_root: '/srv/apache/admins/html', port: 8080)
    notifies :restart, 'service[httpd]'
  end

  file '/srv/apache/admins/html/index.html' do
    content '<h1>Welcome admins!</h1>'
  end
end
