Vagrant::Config.run do |config|
  VAGRANTFILE_API_VERSION = "2"
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.provision :puppet, :module_path => "modules", :options => "--verbose --debug"
  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  config.ssh.forward_agent = true

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port "http", 80, 8080
  config.vm.forward_port 8000, 8000
  config.vm.forward_port 8888, 8888
#  config.vm.forward_port 8080, 8080

  config.vm.network :hostonly, "33.33.33.10"
  config.vm.share_folder("vagrant-root", "/vagrant", ".", :nfs => true)


end
