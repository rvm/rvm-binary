#
# Cookbook Name:: rvm-binary-ruby/binary
# Recipe:: default
#
# Copyright 2012, Michal Papis
#
# All rights reserved - Do Not Redistribute
#

class Chef::Resource::Script
  def log_code command
    if Chef::Config[:log_level] == :debug
      code "{ #{command}; } 2>&1 | tee /var/log/#{@command.to_s.gsub(/ /,"_")}.log; exit ${PIPESTATUS[0]}"
    else
      code command
    end
  end
end

bash "install #{node["platform"]} requirements" do
  reqs = [
    node[:rvm][:requirements][ node["platform"]        ] ||
    node[:rvm][:requirements][ node["platform_family"] ] ||
    node[:rvm][:requirements][ node["os"]              ]
  ].flatten * " && "
  if Chef::Config[:log_level] == :debug
    puts "--- type: #{ node["platform"] } / #{ node["platform_family"] } / #{ node["os"] }"
    puts "--- requirements: #{ reqs }"
  end
  log_code reqs
end

bash "install rvm" do
  log_code "curl -L https://get.rvm.io | bash -s -- --auto"
end

node[:rvm][:binary][:versions].each do |version|
  bash "uninstall #{version}" do
    log_code "/usr/local/rvm/bin/rvm uninstall #{version}"
    only_if "/usr/local/rvm/bin/rvm use #{version}"
  end
  bash "install #{version}" do
    log_code "/usr/local/rvm/bin/rvm install #{version} --movable"
  end
  bash "package #{version}" do
    cwd "/vagrant"
    log_code "/usr/local/rvm/bin/rvm prepare #{version} --path"
  end
end
