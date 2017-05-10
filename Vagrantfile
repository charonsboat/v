# -*- mode: ruby -*-
# vi: set ft=ruby :

# DISCLAIMER: This project is not ready for stable use yet. Use at your own risk. Many changes will come.


# GitHub Configuration

# if you want to maintain your own version of this project, feel free to
# fork it and change the following to reflect your own copy
gh_user   = 'drm2'
gh_repo   = 'v'
gh_branch = 'master' # the latest tag is specified to ensure consistency (you may also use 'master', but future changes may cause errors in your environment)
gh_url    = "https://raw.githubusercontent.com/#{gh_user}/#{gh_repo}/#{gh_branch}/"

# path to .v dir
v_path = '.v'

# if environment isn't 'dev', use remote scripts
v_path.prepend gh_url unless ENV['ENV'] == 'dev'


# Vagrant Configuration

options = {
  max_memory: 2048,
}

Vagrant.configure 2 do |config|
  config.vm.define :v do |v|

    # base box
    v.vm.box = 'ubuntu/trusty64'

    # network configuration
    v.vm.network :forwarded_port, guest: 80,  host: 10080
    # v.vm.network :forwarded_port, guest: 443, host: 10443 # ssl disabled by default

    # virtualbox
    v.vm.provider :virtualbox do |provider, override|
      provider.memory = options[:max_memory]
      provider.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant', '1']
    end
  end
end
