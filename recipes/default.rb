#
# Cookbook Name:: baserole
# Recipe:: default
#
# Copyright 2018, Nic INC
#
# All rights reserved - Do Not Redistribute
#

# Setup the chef client in the way we want
include_recipe 'chef-client::task'


# Install the push jobs client and make sure the service is started
chef_ingredient 'push-jobs-client' do
    action :install
    version :latest
end

windows_service 'push-jobs-client' do
    action :start
  end

# Install chocolatey
powershell_script 'Chocolatey' do
    code <<-EOH
      iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    EOH
    not_if 'Test-Path $env:programdata\chocolatey\bin\choco.exe'
  end

# Add nuget package provider
powershell_script 'Nuget' do
    code <<-EOH
      Install-PackageProvider Nuget -Force
    EOH
    not_if '[bool](Get-PackageProvider nuget -ErrorAction SilentlyContinue)'
  end

# Set timezone via dsc
powershell_package 'xTimezone'

dsc_resource 'Set time zone' do
    resource :xTimeZone
    module_name 'xTimezone'
    property :IsSingleInstance, 'Yes'
    property :TimeZone, 'GMT Standard Time'
  end


#Add the audit cookbook
include_recipe 'audit::default'