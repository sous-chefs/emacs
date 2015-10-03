#
# Cookbook Name:: emacs
# Recipe:: default
#
# Copyright 2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

node['emacs']['packages'].each do |pkg|
  package pkg do
    source 'ports' if platform?('freebsd') && node['platform_version'].to_f < 10.0
  end
end

if node['emacs']['disable_backups']
  fail("['emacs']['site-start-path'] unset, cannot place site-start file") unless node['emacs']['site-start-path']
  cookbook_file "#{node['emacs']['site-start-path']}/70nobackups.el" do
    source '70nobackups.el'
    owner 'root'
    group 'root'
    mode 0644
  end
end
