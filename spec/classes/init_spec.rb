require 'spec_helper'

describe 'octopus', :type => :class do
  let(:facts) { {
      :osfamily  => 'Windows'
  } }
  let(:params) {{
      :ensure       => 'present',
      :server_url   => 'http://octopus.net',
      :tentacle_version	=> '3'
  }}

 # it { should contain_class('octopus::install').that_comes_before('octopus::config') }

  context 'should compile with default values' do
    it {
      is_expected.to compile.with_all_deps
      should contain_class('octopus')
    }
  end

  context 'when trying to install on a non Windows server' do
    let(:facts) { {:osfamily => 'Ubuntu'} }

    it { should compile.and_raise_error(/ERROR:: This module will only work on Windows./) }
  end

  context 'when not passing a valid server_url it should fail' do
    let(:params) {{
        :server_url => 'http//somewhere.com',
        :ensure     => 'present',
        :tentacle_version	=> '3.4.12'
    }}

    it { should compile.and_raise_error(/ERROR: You must enter a server url in a valid format i\.e\. http:\/\/octopus\.net/) }
  end


  context 'when not passing correct values to ensure should fail' do
    let(:params) {{
        :server_url => 'http://somewhere.com',
        :ensure     => 'nope',
        :tentacle_version	=> '3.4.12'
    }}

    it { should compile.and_raise_error(/ERROR: You must specify present or absent/) }
  end

  context 'when not passing tentacle version it should fail' do
    let(:params) {{
        :server_url       => 'http://somewhere.com',
        :ensure           => 'present',
        :tentacle_version	=> ''
    }}

    it { should compile.and_raise_error(/ERROR: You must specify a numeric value/) }
  end

end