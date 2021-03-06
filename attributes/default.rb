#
## Cookbook Name:: crf-confluence
## Recipe:: default
##
## Copyright 2015 Crossroads Foundation
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.

::Chef::Node.send(:include, Opscode::OpenSSL::Password)

override['apache']['default_site_enabled'] = false

default['confluence']['version']                      = '5.9.5'
default['confluence']['install_path']                 = '/opt/confluence'
default['confluence']['shared_path']                  = '/var/confluence'
default['confluence']['run_user']                     = 'confluence'
default['confluence']['log_dir']                      = '/var/log/confluence'
default['confluence']['pid_dir']                      = "#{node['confluence']['install_path']}/current/work"
default['confluence']['create_database']              = false
default['confluence']['database_name']                = 'confluence'
default['confluence']['database_user']                = 'confluence'
default['confluence']['database_password']            = secure_password
default['confluence']['database_host']                = '127.0.0.1'
default['confluence']['database_port']                = node['postgresql']['config']['port']
default['confluence']['database_superuser']           = 'postgres'
default['confluence']['database_superuser_password']  = node['postgresql']['password']['postgres']
default['confluence']['bind_tomcat_port']             = '8000'
default['confluence']['bind_http_port']               = '8080'
default['confluence']['bind_ajp_port']                = '8009'
default['confluence']['context_path']                 = '/'
default['confluence']['hostname']                     = 'confluence'
default['confluence']['domainname']                   = "#{node['confluence']['hostname']}.#{node['domain']}"
default['confluence']['bind_address']                 = '_default_'
default['confluence']['certificate']['data_bag']      = nil
default['confluence']['certificate']['data_bag_type'] = 'unencrypted'
default['confluence']['certificate']['search_id']     = 'cups'
default['confluence']['certificate']['cert_file']     = "#{node['fqdn']}.pem"
default['confluence']['certificate']['key_file']      = "#{node['fqdn']}.key"
default['confluence']['certificate']['chain_file']    = "#{node['hostname']}-bundle.crt"

