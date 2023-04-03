# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=filesystem
pkgver=1.0.0
pkgrel=2
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
  motd
)
sha256sums=('a3244412651ec84fb406df192ff176ca11c13d8544b24b4637bd848e1ff5a87b'
            '988d0ec048e44038f81a357f73eb75b0335a4039b89c5bd1d63f88caf5e81d36'
            '6ec12265d02d88c2b448430533ee3708cd5dbea420fefa40e0a5653627279894'
            '4cc26708349348ad3520dae0e1046ef3d1b6eb823c9e1361aa24062d785595d8'
            'b4d36eb75767bebb41c5fa7a35599952e1883b3d3f6332496e1561eeb4067018'
            '297b784a25fc59641589c6ef05dc26680e2805e9cab37a4ea3699aa072a25c2e'
            '6979dc53ed05ebdacc18700025ccf0232e0985f52aa56d31a5515935e03b04eb'
            'a9589ae7a6d52dd8866e7504023bbe13c233fa3fef9593ceb49d3fdd20675975'
            'c0fca42f35a4c2034fb2105cdd428f65ecd5d5454fc8e58f5620adbfc0ec9509'
            '95b9288fbefc8af3f6412b1369ca2ee2df6daf038e0c035476c0f6bed27307b5')

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
  for user in {passwd,shadow,group,profile,shells,services,protocols,os-release,hosts,motd}; do
    install -m0644 $srcdir/$user "etc/$user"
  done
}
