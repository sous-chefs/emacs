# frozen_string_literal: true

require 'spec_helper'

describe 'emacs_package' do
  step_into :emacs_package

  context 'on Ubuntu with default properties' do
    platform 'ubuntu', '24.04'

    recipe do
      emacs_package 'default'
    end

    it 'installs the default package set' do
      expect(chef_run).to install_package('default').with(package_name: %w(emacs-nox))
    end
  end

  context 'with explicit packages' do
    platform 'ubuntu', '24.04'

    recipe do
      emacs_package 'custom' do
        packages %w(emacs emacs-common-non-dfsg)
      end
    end

    it 'uses the explicit packages instead of defaults' do
      expect(chef_run).to install_package('custom').with(package_name: %w(emacs emacs-common-non-dfsg))
    end
  end

  context 'with action :remove' do
    platform 'ubuntu', '24.04'

    recipe do
      emacs_package 'default' do
        action :remove
      end
    end

    it 'removes the configured packages' do
      expect(chef_run).to remove_package('default').with(package_name: %w(emacs-nox))
    end
  end
end
