# frozen_string_literal: true

name              'emacs'
maintainer        'Sous Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Provides the emacs_package resource for installing Emacs'
version           '1.0.0'
source_url        'https://github.com/sous-chefs/emacs'
issues_url        'https://github.com/sous-chefs/emacs/issues'
chef_version      '>= 15.3'

supports 'almalinux', '>= 9.0'
supports 'ubuntu', '>= 22.04'
supports 'debian', '>= 12.0'
supports 'redhat', '>= 9.0'
supports 'fedora'
supports 'arch'
supports 'freebsd'
