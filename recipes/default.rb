#
# Cookbook Name:: baserole
# Recipe:: default
#
# Copyright 2018, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# Install the push jobs ingredient
chef_ingredient 'push-jobs-client' do
    action :install
    version :latest
end

# make sure the created service is running
windows_service 'push-jobs-client' do
    action :start
  end
