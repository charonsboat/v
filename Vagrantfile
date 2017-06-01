require 'yaml'

# GitHub Configuration

# if you want to maintain your own version of this project, feel free to
# fork it and change the following to reflect your own copy
gh_user   = 'drm2'
gh_repo   = 'v'
gh_branch = 'master' # the latest tag is specified to ensure consistency (you may also use 'master', but future changes may cause errors in your environment)
gh_url    = "https://raw.githubusercontent.com/#{gh_user}/#{gh_repo}/#{gh_branch}/"

# path to .v dir
v_path = '.v'

# use remote scripts by default, local if specified
v_path.prepend gh_url unless ENV['local']


# Vagrant Configuration

options = {
  max_memory: 2048,
}

Vagrant.configure 2 do |config|
  config.vm.define :v do |v|

    # base box
    v.vm.box = 'bento/ubuntu-16.04'

    # network configuration
    v.vm.network :private_network, ip: '192.168.11.55'
    v.vm.network :forwarded_port, guest: 80,  host: 10080
    # v.vm.network :forwarded_port, guest: 443, host: 10443 # ssl disabled by default

    # virtualbox
    v.vm.provider :virtualbox do |provider, override|
      provider.memory = options[:max_memory]
      provider.customize ['setextradata', :id, 'VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant', '1']
    end

    # load projects.yaml if it exists
    projects = File.file?('projects.yaml') ? YAML.load_file('projects.yaml') : []


    ## provision stuff

    # docker
    v.vm.provision :shell, privileged: false, path: "#{v_path}/packages/docker.sh", args: []

    # docker-compose
    v.vm.provision :shell, privileged: false, path: "#{v_path}/packages/docker-compose.sh", run: :always, args: projects
  end
end
