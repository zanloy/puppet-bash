# frozen_string_literal: true

require 'spec_helper'

osfamilies = {
  'ArchLinux' => { package: 'core/bash', bashrc: '/etc/bash.bashrc' },
  'RedHat'    => { package: 'bash', bashrc: '/etc/bashrc' },
  'Debian'    => { package: 'bash', bashrc: '/etc/bash.bashrc' }
}

describe 'bash' do
  osfamilies.each do |osfamily, values|
    context "on #{osfamily}" do
      let(:facts) { { osfamily: osfamily } }
      context 'installs package' do
        it { should contain_package(values[:package]) }
      end
      context 'with default bashrcd' do
        it { should contain_file('/etc/bashrc.d') }
        context 'with bashrcd_purge' do
          it { should contain_file('/etc/bashrc.d').with_purge('true') }
        end
        context 'with bashrcd_purge false' do
          let(:params) { { bashrcd_purge: 'false' } }
          it { should contain_file('/etc/bashrc.d').with_purge('false') }
        end
      end
      context 'with custom bashrcd' do
        let(:params) { { bashrcd: '/etc/bash/bashrc.d' } }
        it { should contain_file('/etc/bash/bashrc.d') }
        context 'with bashrcd_purge' do
          it { should contain_file('/etc/bash/bashrc.d').with_purge('true') }
        end
        context 'with bashrcd_purge false' do
          let(:params) { super().merge(bashrcd_purge: 'false') }
          it { should contain_file('/etc/bash/bashrc.d').with_purge('false') }
        end
      end
      context 'without environment' do
        it { should contain_file(values[:bashrc]).with_content(/^buffer="\$\{txtgreen\}.*$/) }
      end
      context 'with environment set to production' do
        let(:params) { { environment: 'production' } }
        it { should contain_file(values[:bashrc]).with_content(/^buffer="\$\{txtred\}.*$/) }
      end
      context 'with default append_paths' do
        it { should contain_file(values[:bashrc]).without_content(/^PATH=\$PATH:$/) }
      end
      context 'with custom append_paths' do
        let(:params) { { append_paths: ['/scripts', '/bin'] } }
        it { should contain_file(values[:bashrc]).with_content(%r{^PATH=\$PATH:/scripts:/bin$}) }
      end
      context 'with default trim_suffix' do
        it { should contain_file(values[:bashrc]).with_content(/^fqdn_short=\$\{fqdn%\*\}$/) }
      end
      context 'with trim_suffix' do
        let(:params) { { trim_suffix: '.example.com' } }
        it { should contain_file(values[:bashrc]).with_content(/^fqdn_short=\$\{fqdn%\.example\.com\*\}$/) }
      end
      context 'without vi_mode' do
        it { should contain_file(values[:bashrc]).without_content(/^set -o vi$/) }
      end
      context 'with vi_mode set' do
        let(:params) { { vi_mode: true } }
        it { should contain_file(values[:bashrc]).with_content(/^set -o vi$/) }
      end
      context 'with default aliases' do
        it { should contain_file(values[:bashrc]).without_content(/^alias .*$/) }
      end
      context 'with custom aliases' do
        let(:params) { { aliases: { 'yum' => 'sudo yum' } } }
        it { should contain_file(values[:bashrc]).with_content(/^alias yum='sudo yum'$/) }
      end
    end
  end
end
