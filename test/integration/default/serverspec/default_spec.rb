require 'serverspec'

set :backend, :exec

describe 'emacs' do
  let(:emacs_version) { command('emacs --version | head -1') }

  it 'should have emacs version 24' do
    expect(emacs_version.stdout).to match(/^GNU Emacs 24/)
  end

  describe 'backups disable file' do
    site_start_dir = case host_inventory['platform']
                     when 'debian', 'ubuntu'
                       '/etc/emacs/site-start.d'
                     when 'redhat', 'centos'
                       '/usr/share/emacs/site-lisp/site-start.d'
                     else
                       fail("Unknown platform #{host_inventory['platform']}")
                     end

    describe file "#{site_start_dir}/70nobackups.el" do
      it { should be_file }
      it { should contain '(setq backup-inhibited t)' }
      it { should contain '(setq auto-save-default nil)' }
    end
  end
end
