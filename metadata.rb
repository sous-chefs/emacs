name              'emacs'
maintainer        'Joshua Timberman'
maintainer_email  'cookbooks@housepub.org'
license           'Apache 2.0'
description       'Installs emacs'
version           '0.10.0'

recipe 'emacs', 'Installs Emacs'

%w(ubuntu debian redhat centos scientific fedora arch freebsd).each do |os|
  supports os
end
