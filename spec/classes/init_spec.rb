require 'spec_helper'

osfamilies = {
  'ArchLinux' => { package: 'core/bash', bashrc: '/etc/bash.bashrc' },
  'RedHat'    => { package: 'bash', bashrc: '/etc/bashrc' },
  'Debian'    => { package: 'bash', bashrc: '/etc/bash.bashrc' },
}

describe 'bash' do
  osfamilies.each do |osfamily, values|
    context "on #{osfamily}" do
      let(:facts) {
        { osfamily: osfamily }
      }
      context 'installs package' do
        it { should contain_package(values[:package]) }
      end
      it { should contain_file(values[:bashrc]) }
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
          let(:params) { super().merge({bashrcd_purge: 'false'}) }
          it { should contain_file('/etc/bash/bashrc.d').with_purge('false') }
        end
      end
      context 'without environment' do
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^buffer="\$\{txtgreen\}.*$/)
        end
      end
      context 'with environment set to production' do
        let(:params) { { environment: 'production' } }
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^buffer="\$\{txtred\}.*$/)
        end
      end
      context 'with default append_paths' do
        it do
          should contain_file(values[:bashrc]) \
            .without_content(/^PATH=\$PATH:$/)
        end
      end
      context 'with custom append_paths' do
        let(:params) { { append_paths: ['/scripts', '/bin'] } }
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^PATH=\$PATH:\/scripts:\/bin$/)
        end
      end
      context 'with default trim_suffix' do
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^fqdn_short=\$\{fqdn%\*\}$/)
        end
      end
      context 'with trim_suffix' do
        let(:params) { { trim_suffix: '.example.com' } }
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^fqdn_short=\$\{fqdn%\.example\.com\*\}$/)
        end
      end
      context 'without vi_mode' do
        it do
          should contain_file(values[:bashrc]) \
            .without_content(/^set -o vi$/)
        end
      end
      context 'with vi_mode' do
        let(:params) { { vi_mode: true } }
        it do
          should contain_file(values[:bashrc]) \
            .with_content(/^set -o vi$/)
        end
      end
    end
  end
end
