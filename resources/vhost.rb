
property :site_name, String

action :create do
  directory "/srv/apache/#{site_name}/html" do
    recursive true
    mode '0755'
  end

  directory '/etc/httpd/conf/d' do
    recursive true
    mode '0755'
  end

  template "/etc/httpd/conf/d/#{site_name}.conf" do
    source 'conf.erb'
    mode '0644'
    variables(document_root: "/srv/apache/#{site_name}/html", port: 8080)
    notifies :restart, 'service[httpd]'
  end

  file "/srv/apache/#{site_name}/html/index.html" do
    content "<h1>Welcome #{site_name}!</h1>"
  end
end
