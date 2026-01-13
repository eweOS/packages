# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=itstool
pkgver=2.0.7
pkgrel=3
pkgdesc="XML to PO and back again"
arch=(any)
url="http://itstool.org/"
license=(GPL3)
depends=(python libxml2)
makedepends=(git)
source=("git+https://github.com/itstool/itstool#tag=$pkgver")
sha256sums=('7e782e2948e05c82eb21e528811212fc55776b4af412fab2a66447f95c8a0310')

prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname
  make check
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
