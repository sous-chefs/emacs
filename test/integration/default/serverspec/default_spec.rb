require 'serverspec'

set :backend, :exec

describe 'emacs' do
  let(:emacs_version) { command('emacs --version | head -1') }

  it 'should have emacs version 24' do
    expect(emacs_version.stdout).to match(/^GNU Emacs 24/)
  end
end
