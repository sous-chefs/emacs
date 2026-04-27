# frozen_string_literal: true

require_relative '../../spec_helper'

control 'emacs-package-01' do
  impact 1.0
  title 'The emacs binary is available'

  describe file(emacs_binary) do
    it { should exist }
    it { should be_executable }
  end
end

control 'emacs-package-02' do
  impact 1.0
  title 'Emacs reports a version'

  describe command("#{emacs_binary} --version") do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/^GNU Emacs /) }
  end
end
