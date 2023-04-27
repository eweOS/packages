# Maintainer: YukariChiba <i@0x7f.cc>
pkgname=hwdata
pkgver=0.369
pkgrel=1
pkgdesc="hardware identification and configuration databases."
url=https://github.com/vcrhonek/hwdata
license=('GPL2')
arch=('any')
source=("$url/archive/refs/tags/v0.369.tar.gz")
sha256sums=('b17f3b81b887b9027fe5efa1ab1099afb472c843f89a9f5cc9ca4030b75bbdb2')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-blacklist
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
