# frozen_string_literal: true

apt_update 'update package cache' if platform_family?('debian')

emacs_package 'default'
