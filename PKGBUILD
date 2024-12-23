# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
_pkgver=0.1.0
pkgver=0.1.0
pkgrel=17
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
_url="https://github.com/eweOS/tinyramfs"
license=('GPL3')
depends=('sh')
makedepends=('git')
_refcommit="de2d6aea4dfe1b284ed0d485f0acd16303ff253b"
_commit="465b1fc2f010cb7125a7f8e178faf62f499a255c"
options=(emptydirs)
backup=("etc/$pkgname/config")
source=(
  "git+$_url.git#commit=$_commit"
)
sha512sums=('046cf651fdf22d8f6e610c6d86d788c794f1f96dae130b6a03fab54fe21f9d4e6ea26428630853dca6ff3eb96eab648aaf6ff08b8a8332bdb1ae22a86c94da9a')

pkgver()
{
  cd $pkgname
  printf "${_pkgver}.r%s.%s" "$(git rev-list --count $_refcommit..HEAD)" "$(git rev-parse --short HEAD)"
}

check()
{
  cd $pkgname
  # need all component presents
  #make check
}

package()
{
  cd $pkgname
  make PREFIX=/usr DESTDIR=$pkgdir install
  
  # config
  install -d $pkgdir/etc/$pkgname $pkgdir/usr/share/$pkgname
  install -D config.example.conf $pkgdir/usr/share/$pkgname/config.example.conf
  echo "# empty config, see /usr/share/$pkgname/config.example.conf" > $pkgdir/etc/$pkgname/config

  # doc
  install -d $pkgdir/usr/share/man/{man5,man8}
  install -D doc/tinyramfs.5 $pkgdir/usr/share/man/man5/
  install -D doc/tinyramfs.8 $pkgdir/usr/share/man/man8/
}
