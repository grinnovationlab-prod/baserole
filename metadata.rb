name             'baserole'
maintainer       'Nic'
maintainer_email 'Nic@Example.com'
license          'All rights reserved'
description      'Installs/Configures baserole'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.10'
depends          'chef-ingredient'
depends          'audit'
depends          'chef-client'
supports         'windows'