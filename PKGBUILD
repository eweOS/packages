# Maintainer: Yukari Chiba <i@0x7f.cc>
# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=filesystem
pkgver=1.0.0
pkgrel=13
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
  issue
  resolv.conf
  locale.sh
  eweos-logo.png
  eweos-logo.svg
  eweos-logo-text.svg
  eweos-logo-text-dark.svg
)
sha256sums=('e787b373a74594b33b77892a903647d7a6cf519d427a0b0790e11be4482696e0'
            '7a696fcfba89a55a6d73fa1a03c7f071fad2141340027b17a25db249e26b9be8'
            'a4abe526ffddba92235d6613d871f3089eb48b4f02bd70a1d58b240ebc220c34'
            '4cc26708349348ad3520dae0e1046ef3d1b6eb823c9e1361aa24062d785595d8'
            'b4d36eb75767bebb41c5fa7a35599952e1883b3d3f6332496e1561eeb4067018'
            '297b784a25fc59641589c6ef05dc26680e2805e9cab37a4ea3699aa072a25c2e'
            '6979dc53ed05ebdacc18700025ccf0232e0985f52aa56d31a5515935e03b04eb'
            'c2c5bcc232314cdad3c452b955fbdb01192ae51ce7c8cab37e216edf4d6483f0'
            'c0fca42f35a4c2034fb2105cdd428f65ecd5d5454fc8e58f5620adbfc0ec9509'
            '95b9288fbefc8af3f6412b1369ca2ee2df6daf038e0c035476c0f6bed27307b5'
            '45d48dd125685c737136fc3deae94887bbdba46a5fb59244fb1ffb39cadb6620'
            'b5e477832d662a3c243587fc7b280b7a0c2d962294204ff60153086067fe8c15'
            '9f02adee14824f78aa37a6911f8e00c5f42676ea8bb9fd6fa8bd24f2578858e0'
            'adb040b79a9b89757f46b2cfdcbcbc5c73cb8d96c55aabf0ef003b438eab5777'
            'e131d584a0cad9f1c1a64d291515b3de6f2ac36578466735122d991d54539424'
            '7d27a061508ab64d1920406eab149eb573b87b1ca60f03ec135e7496ec80976d'
            '79c7492eb352152e2cf609a2b3387a6b0cb71907a48db7b2be423715cb688992'
            '30576859726bb4f3766f5333e9926ae5ce4307672c4b7b4ef69f69fd614f45dd')

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
  etc/issue
  etc/resolv.conf
)

package()
{
  cd ${pkgdir}

  # directories
    # base dir
  install -d -m 755 "boot" "dev" "etc/default" "home" "mnt" "srv" "usr" "run" "opt"
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
  for user in {passwd,shadow,group,profile,shells,services,protocols,os-release,hosts,motd,fstab,issue,resolv.conf}; do
    install -m0644 -t etc $srcdir/$user
  done

  # files in /etc/profile.d
  install -d etc/profile.d
  install -m0644 $srcdir/locale.sh "etc/profile.d/20-setlocale.sh"

  # logo
  install -d usr/share/pixmaps
  install -m0644 -t usr/share/pixmaps $srcdir/eweos-logo.{png,svg}
  install -m0644 -t usr/share/pixmaps $srcdir/eweos-logo-text{,-dark}.svg
}
