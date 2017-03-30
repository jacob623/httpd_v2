
require 'spec_helper'

describe_ohai_plugin :Apache do
  let(:plugin_file) { 'files/default/httpd_modules.rb' }

  it 'provides apache/modules' do
    expect(plugin).to provides_attribute('apache/modules')
  end

  it 'correctly captures output' do
    stub_plugin_shell_out('apachectl -t -D DUMP_MODULES', 'OUTPUT')
    expect(plugin_attribute('apache/modules')).to eq('OUTPUT')
  end
end
