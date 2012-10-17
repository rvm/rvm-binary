default[:rvm][:binary][:versions] = %W( ruby-1.9.3-p194 ruby-1.9.3-p286 )
default[:rvm][:requirements][:debian] = [
  "sudo apt-get --quiet --yes update",
  "sudo apt-get --no-install-recommends --quiet --yes install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config"
]
default[:rvm][:requirements][:gentoo] = [
  "sudo emerge libiconv readline zlib openssl curl git libyaml sqlite libxslt libtool gcc autoconf automake bison m4"
]
default[:rvm][:requirements][:arch] = [
  "sudo pacman -Sy --noconfirm gcc patch curl zlib readline libxml2 libxslt git autoconf automake diffutils make libtool bison subversion"
]
default[:rvm][:requirements][:rhel] = [
  "yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel"
]
default[:rvm][:requirements][:fedora] = [
  "sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison iconv-devel"
]
default[:rvm][:requirements][:suse] = [
  "sudo zypper install -y patterns-openSUSE-devel_basis gcc-c++ bzip2 readline-devel zlib-devel libxml2-devel libxslt-devel libyaml-devel libopenssl-devel libffi45-devel libtool bison"
]
default[:rvm][:requirements][:freebsd] = [
  "sudo pkg_add gcc curl readline libxml2 libxslt git autoconf automake diffutils make libtool bison subversion"
]
default[:rvm][:requirements][:openbsd] = [
  "sudo pkg_add gcc curl readline libxml2 libxslt git autoconf automake diffutils make libtool bison subversion"
]
default[:rvm][:requirements][:netbsd] = [
  "sudo pkg_add gcc curl readline libxml2 libxslt git autoconf automake diffutils make libtool bison subversion"
]
default[:rvm][:requirements][:smartos] = [
  "sudo pkgin install coreutils patch gcc47 gmake readline curl scmgit-base sqlite3 libxml2 libxslt ncurses autoconf automake"
]
default[:rvm][:requirements][:solaris2] = [
  "sudo pkg install text/gnu-patch developer/gcc-45 developer/library/lint system/header system/library/math/header-math file/gnu-coreutils"
]
