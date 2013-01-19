default[:rvm][:binary][:versions] = %W( ruby-1.9.3-p374 ruby-2.0.0-rc1 )
default[:rvm][:requirements][:ubuntu] =
default[:rvm][:requirements][:debian] = [
  "sudo apt-get --quiet --yes update",
  "sudo apt-get --no-install-recommends --quiet --yes install bash curl"
]
