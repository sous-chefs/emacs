# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../libraries/helpers'

describe Emacs::Cookbook::Helpers do
  subject(:helper) do
    Class.new do
      include Emacs::Cookbook::Helpers

      def initialize(node)
        @node = node
      end

      attr_reader :node
    end.new(node)
  end

  context 'on Debian family platforms' do
    let(:node) do
      Chef::Node.new.tap do |chef_node|
        chef_node.automatic['platform_family'] = 'debian'
      end
    end

    it 'defaults to emacs-nox' do
      expect(helper.default_packages).to eq(%w(emacs-nox))
    end
  end

  context 'on Fedora family platforms' do
    let(:node) do
      Chef::Node.new.tap do |chef_node|
        chef_node.automatic['platform_family'] = 'fedora'
      end
    end

    it 'defaults to emacs-nw' do
      expect(helper.default_packages).to eq(%w(emacs-nw))
    end
  end

  context 'on other platforms' do
    let(:node) do
      Chef::Node.new.tap do |chef_node|
        chef_node.automatic['platform_family'] = 'freebsd'
      end
    end

    it 'defaults to emacs' do
      expect(helper.default_packages).to eq(%w(emacs))
    end
  end
end
