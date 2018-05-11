#
# Cookbook Name:: baserole
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
chef_ingredient 'push-jobs-client' do
    action :install
    version :latest
end
