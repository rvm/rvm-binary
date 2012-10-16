#
# Cookbook Name:: rvm-binary-ruby/binary
# Recipe:: default
#
# Copyright 2012, Michal Papis
#
# All rights reserved - Do Not Redistribute
#

bash "install #{node["platform"]} requirements" do
  code [
    node[:rvm][:requirements][ node["platform"]        ] ||
    node[:rvm][:requirements][ node["platform_family"] ] ||
    node[:rvm][:requirements][ node["os"]              ]
  ].flatten * "; "
end

bash "install rvm" do
  code "curl -L https://get.rvm.io | bash -s -- --auto"
end

node[:rvm][:binary][:versions].each do |version|
  bash "uninstall #{version}" do
    code "/usr/local/rvm/bin/rvm uninstall #{version}"
    only_if "rvm use #{version}"
  end
  bash "install #{version}" do
    code "/usr/local/rvm/bin/rvm install #{version} --movable"
  end
  bash "package #{version}" do
    cwd "/vagrant"
    code "/usr/local/rvm/bin/rvm prepare #{version} --path"
  end
end
