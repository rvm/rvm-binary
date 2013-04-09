#!/usr/bin/env ruby

require 'yaml'

configuration = YAML::load_file('config.yml')
binaries = ENV.has_key?("RUBY_VERSIONS") ? ENV["RUBY_VERSIONS"].split(/ /) : configuration["binaries"]
distributions = configuration["distributions"]

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
  config.vm.provision :shell, :path => "install-rvm.sh"
  binaries.each do |binary|
    config.vm.provision :shell, :path => "install-ruby.sh", :args => binary
  end
end
