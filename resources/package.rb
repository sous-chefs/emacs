# frozen_string_literal: true

provides :emacs_package
unified_mode true
include Emacs::Cookbook::Helpers

property :packages, [String, Array],
         coerce: proc { |value| Array(value) },
         default: lazy { default_packages }

default_action :install

action_class do
  include Emacs::Cookbook::Helpers
end

action :install do
  package new_resource.name do
    package_name new_resource.packages
    action :install
  end
end

action :remove do
  package new_resource.name do
    package_name new_resource.packages
    action :remove
  end
end
