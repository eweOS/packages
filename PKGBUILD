# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libmng
pkgver=2.0.3
pkgrel=1
pkgdesc="A collection of routines used to create and manipulate MNG format graphics files"
arch=(x86_64 aarch64 riscv64)
url='https://www.libmng.com/'
license=(LicenseRef-libmng)
depends=(lcms2
         libjpeg-turbo
         zlib)
makedepends=(autoconf)
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('4a462fdd48d4bc82c1d7a21106c8a18b62f8cc0042454323058e6da0dbb57dd3')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
