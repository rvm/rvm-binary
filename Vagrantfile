#!/usr/bin/env ruby

require 'yaml'

distributions = YAML::load_file('distributions.yml')

Vagrant::Config.run do |global_config|
  distributions.each do |name, url|
    global_config.vm.define name.to_sym do |config|
      config.vm.box = name
      config.vm.box_url = url
      config.vm.customize [
        "modifyvm", :id,
        "--memory", "1024",
        "--cpus", "2",
        "--ioapic", "on",
      ]
      config.vm.provision :shell do |shell|
        shell.inline = <<-EOF
          which chef-client >/dev/null 2>&1 || sudo gem install chef --no-ri --no-rdoc --no-user-install
        EOF
      end
      config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = "cookbooks"
        chef.add_recipe "binary"
        chef.log_level = :debug
      end
    end
  end
end
