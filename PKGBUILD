# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=filesystem
pkgver=1.0.0
pkgrel=7
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
  fstab
)
sha256sums=('4fecb0831d4cc037813cf758bf8957f7d979c6415a139efca4c8554e159242d1'
            'ab1e9388edd7947b307b9812f5648f738d797117d99a91deb7e4fb2096c1926f'
            'a4abe526ffddba92235d6613d871f3089eb48b4f02bd70a1d58b240ebc220c34'
            '4cc26708349348ad3520dae0e1046ef3d1b6eb823c9e1361aa24062d785595d8'
            'b4d36eb75767bebb41c5fa7a35599952e1883b3d3f6332496e1561eeb4067018'
            '297b784a25fc59641589c6ef05dc26680e2805e9cab37a4ea3699aa072a25c2e'
            '6979dc53ed05ebdacc18700025ccf0232e0985f52aa56d31a5515935e03b04eb'
            'a9589ae7a6d52dd8866e7504023bbe13c233fa3fef9593ceb49d3fdd20675975'
            'c0fca42f35a4c2034fb2105cdd428f65ecd5d5454fc8e58f5620adbfc0ec9509'
            '95b9288fbefc8af3f6412b1369ca2ee2df6daf038e0c035476c0f6bed27307b5'
            '45d48dd125685c737136fc3deae94887bbdba46a5fb59244fb1ffb39cadb6620')

backup=(
  etc/passwd
  etc/group
  etc/profile
  etc/shadow
  etc/shells
  etc/services
  etc/protocols
  etc/hosts
  etc/fstab
)

package()
{
  cd ${pkgdir}

  # directories
    # base dir
  install -d -m 755 "boot" "dev" "etc/default" "home" "mnt" "srv" "usr" "run"
  install -d -m 750 "root"
  install -d -m 555 "proc" "sys"
  install -d -m 1777 "tmp" "var/tmp"
    # usr dir
  install -d "usr/"{bin,include,local/bin,local/sbin,share/man,lib/modules}
    # var dir
  install -d "var/"{cache,lib,log,spool}

  # symlinks
    # var
  ln -s spool/mail var/mail
  ln -s "../run" var/run
  ln -s "../run/lock" var/lock
    # bin/lib
  ln -s "usr/lib" lib
  ln -s "usr/bin" bin
  ln -s "usr/bin" sbin
  ln -s "bin" usr/sbin
    # mtab
  ln -s "../proc/mounts" "etc/mtab"

  [[ $CARCH = 'x86_64' ]] && {
    ln -s usr/lib lib64
    ln -s lib usr/lib64
  }

  # files in /etc
  for user in {passwd,shadow,group,profile,shells,services,protocols,os-release,hosts,motd,fstab}; do
    install -m0644 $srcdir/$user "etc/$user"
  done
}
