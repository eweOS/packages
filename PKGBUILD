# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=tinyramfs
pkgver=0.1.0
pkgrel=1
pkgdesc="Tiny initramfs generator written in POSIX shell"
arch=('any')
url="https://github.com/illiliti/tinyramfs"
license=('GPL3')
depends=('sh')
source=("$url/archive/refs/tags/${pkgver}.tar.gz" "config")
sha512sums=('SKIP' 'SKIP')

check()
{
  cd $pkgname-$pkgver
  # need all component presents
  #make check
}

package()
{
  cd $pkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -d $pkgdir/etc/$pkgname
  install -D $srcdir/config $pkgdir/etc/$pkgname/config
}
