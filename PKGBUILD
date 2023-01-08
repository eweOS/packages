# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=filesystem
pkgver=1.0.0
pkgrel=1
pkgdesc='The base directory structure and a few core files for the system.'
arch=(any)
url='https://os.ewe.moe'
license=(MIT)
groups=(base)
options=(emptydirs)
source=(
  passwd
  group
  profile
  shells
  services
  protocols
  shadow
  os-release
  hosts
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

backup=(
  etc/passwd
  etc/group
  etc/profile
  etc/shadow
  etc/shells
  etc/services
  etc/protocols
  etc/hosts
)

package()
{
  cd ${pkgdir}
  install -d "boot" "dev" "etc/default" "home" "mnt"
  ln -s "../proc/mounts" "etc/mtab"
  install -d -m 0555 "proc" "sys"
  install -d -m 0750 "root"
  install -d -m 0755 "run"
  install -d -m 1777 "tmp"
  install -d "srv"
  install -d "usr/"{bin,include,local/bin,local/sbin,share/man,lib/modules}
  install -d "var/"{cache,lib,log,mail,spool}
  ln -s "../run" var/run
  ln -s "../run/lock" var/lock
  ln -s "usr/lib" lib
  ln -s "usr/lib" lib64
  ln -s "usr/bin" bin
  ln -s "usr/bin" sbin
  ln -s "lib" usr/lib64
  ln -s "bin" usr/sbin
  install -d -m 1777 "var/tmp"
  for user in {passwd,shadow,group,profile,shells,services,protocols,os-release,hosts}; do
    install -m0644 $srcdir/$user "etc/$user"
  done
}
