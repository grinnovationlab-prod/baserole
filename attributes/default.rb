default['audit']['reporter'] = 'chef-server-automate'
default['audit']['profiles'] ||= []
default['audit']['profiles'] << {name: 'Baserole Security Profile', compliance: 'chef/baserole-security-profile',}