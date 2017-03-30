describe command('curl http://localhost') do
  its(:stdout) { should match(/Welcome users/) }
end

describe command('curl http://localhost:8080') do
  its(:stdout) { should match(/Welcome admins/) }
end

plugin_directory = '/tmp/kitchen/ohai/plugins'
describe command("ohai -d #{plugin_directory} apache") do
  its(:stdout) { should match(/core_module/) }
end

