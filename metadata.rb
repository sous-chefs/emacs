name              "emacs"
maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs emacs"
version           "0.9.1"

recipe "emacs", "Installs Emacs"

%w{ ubuntu debian redhat centos scientific fedora arch freebsd }.each do |os|
  supports os
end
