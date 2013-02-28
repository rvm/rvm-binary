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
      code "{ #{command}; _ret=$?; echo \"Exit status was $_ret.\"; exit $_ret; } 2>&1 |
        tee /var/log/#{@command.to_s.gsub(/ /,"_")}.log; exit ${PIPESTATUS[0]}"
    else
      code command
    end
  end
end

package "patch"
package "build-essential"
package "git-core"

reqs = [
  node[:rvm][:requirements][ node["platform"]        ] ||
  node[:rvm][:requirements][ node["platform_family"] ] ||
  node[:rvm][:requirements][ node["os"]              ]
].flatten * " && "
unless reqs.empty?
  bash "install #{node["platform"]} requirements" do
    if Chef::Config[:log_level] == :debug
      puts "--- type: #{ node["platform"] } / #{ node["platform_family"] } / #{ node["os"] }"
      puts "--- requirements: '#{reqs}'"
    end
    log_code reqs
  end
end

installer_options="--auto-dotfiles"
rvm_command="/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm"
bash "install rvm" do
  if File.directory? "/vagrant/rvm-src"
    cwd "/vagrant/rvm-src"
    log_code "./install #{installer_options}"
  else
    $stderr.puts "rvm-src not found falling back to download"
    log_code "curl -L https://get.rvm.io | bash -s -- #{installer_options}"
  end
end

%w( archives repos ).each do |type|
  if File.directory? "/vagrant/rvm-#{type}"
    bash "link rvm #{type}" do
      log_code "rm -rf /usr/local/rvm/#{type} && ln -s /vagrant/rvm-#{type}/ /usr/local/rvm/#{type} "
    end
  else
    $stderr.puts "rvm-#{type} missing, shared #{type} disabled"
  end
end

bash "install rvm requirements" do
  log_code "#{rvm_command} requirements run force"
end

node[:rvm][:binary][:versions].each do |version|
  bash "uninstall #{version}" do
    log_code "#{rvm_command} uninstall #{version}"
    only_if "#{rvm_command} use #{version}"
  end
  bash "install #{version}" do
    log_code "#{rvm_command} install #{version} --movable"
  end
  bash "package #{version}" do
    cwd "/vagrant"
    log_code "#{rvm_command} prepare #{version} --path"
  end
end
