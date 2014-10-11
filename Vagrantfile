domain = 'familyguy.com'
VAGRANTFILE_API_VERSION = "2"
#VAGRANT_BOX_URL = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130731.box"
VAGRANT_BOX_URL = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
VAGRANT_TMP_NAME = "rh6_minimal"
VBGUI = false

nodes = [
  { :hostname => 'template', :ip => '192.168.2.200', :box => 'rh6_minimal' },
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  #If template box is not installed download and install and name centos-min

  config.vm.box_url = VAGRANT_BOX_URL
  config.vm.box     = VAGRANT_TMP_NAME

  nodes.each do |node|
      config.vm.define node[:hostname] do |node_config|
        node_config.vm.box = node[:box]
        node_config.vm.host_name = node[:hostname] + '.' + domain
        node_config.vm.network :private_network, ip: node[:ip]
        node_config.vm.synced_folder "puppet/modules", "/etc/puppet/modules"
      
        
        #Set memory default to 480MB if not defined in nodes array
        memory = node[:ram] ? node[:ram] : 480;
        node_config.vm.provider :virtualbox do |vb|
        
          #Set VBGUI to true if you want to troubleshoot the bootup of the VM's
          vb.gui = VBGUI
          #Modify the vm's config..most important (--name) this changes the name in the virtualbox interface
          vb.customize ['modifyvm', :id, '--name', node[:hostname], '--memory', memory.to_s ]
       end
     end
  end

  #Sets up the puppet provisioner so it can be used to provisioin the server.
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path    = 'puppet/manifests'
    puppet.manifest_file     = 'site.pp'
    puppet.module_path       = 'puppet/modules'
    #puppet.hiera_config_path = 'puppet/hiera.yaml'
    puppet.working_directory = '/vagrant/puppet'
    puppet.options           = "--verbose --debug"
  end
end
