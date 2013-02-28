#!/usr/bin/env ruby

require 'yaml'
require 'berkshelf/vagrant'

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
          [[ -s /etc/gemrc ]] && grep -- '--user-install' /etc/gemrc >/dev/null && sudo sed -i'' -- '/--user-install/ d' /etc/gemrc || true ;
          which chef-client >/dev/null 2>&1 || sudo gem install chef --no-ri --no-rdoc --no-user-install || true ;
          sudo sed -i'' '/^127.0.0.1[[:space:]]*localhost$/ s/$/ '"$(hostname)"'/' /etc/hosts || true ;
        EOF
      end
      config.vm.provision :chef_solo do |chef|
        chef.add_recipe "rvm-binary"
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
  end
end
