# frozen_string_literal: true

module Emacs
  module Cookbook
    module Helpers
      def default_packages
        case node['platform_family']
        when 'debian'
          %w(emacs-nox)
        when 'fedora'
          %w(emacs-nw)
        else
          %w(emacs)
        end
      end
    end
  end
end
