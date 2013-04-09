#!/usr/bin/env ruby

require 'yaml'

distributions = YAML::load_file('distributions.yml')

Vagrant.configure("2") do |config|
  distributions.each do |name, url|
    config.vm.define name.to_sym do |config|
      config.vm.box = name
      config.vm.box_url = url
    end
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024",
      "--cpus", "2",
      "--ioapic", "on",
    ]
  end

  config.vm.provision :shell, :path => "setup-vm.sh"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.add_recipe "binary"
    chef.log_level = :debug
    if ENV.has_key?("RUBY_VERSIONS")
      chef.json = {
        :rvm => {
          :binary => {
            :versions => ENV["RUBY_VERSIONS"].split(/ /)
          }
        }
      }
    end
  end
end
