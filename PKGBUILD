# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
_pkgver=0.1.0
pkgver=0.1.0
pkgrel=18
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
_url="https://github.com/eweOS/tinyramfs"
license=('GPL3')
depends=('sh')
makedepends=('git')
_refcommit="de2d6aea4dfe1b284ed0d485f0acd16303ff253b"
_commit="55753b162f9784802f03fc118ebba258fbfe0b6b"
options=(emptydirs)
backup=("etc/$pkgname/config")
source=(
  "git+$_url.git#commit=$_commit"
)
sha512sums=('91449c73dc7a05627372a7b2d9d597df614d86220cd4f57d100b7c1131dd705eb32a2a2b11fd3c075207303814209ed5194cf1667241c5ce49f2bd4345384743')

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
