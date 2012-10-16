default[:rvm][:binary][:versions] = %W( ruby-1.9.3-p194 ruby-1.9.3-p286 )
default[:rvm][:requirements][:ubuntu] = [
  "sudo apt-get --quiet --yes update",
  "sudo apt-get --no-install-recommends --quiet --yes install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config"
]
