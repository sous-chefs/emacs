name              'emacs'
maintainer        'Sous-Chefs'
maintainer_email  'help@sous-chefs.org'
license           'Apache-2.0'
description       'Installs emacs'
version           '0.11.2'

%w(ubuntu debian redhat centos scientific fedora arch freebsd).each do |os|
  supports os
end
