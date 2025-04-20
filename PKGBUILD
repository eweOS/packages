# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraw
pkgver=0.21.4
pkgrel=1
pkgdesc='A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://www.libraw.org/'
license=(CDDL LGPL)
depends=(lcms2
         libjpeg
         zlib)
makedepends=(autoconf)
source=(https://www.libraw.org/data/LibRaw-$pkgver.tar.gz)
sha256sums=('6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63')

prepare() {
  cd LibRaw-$pkgver
  autoreconf -fiv
}

build() {
  cd LibRaw-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd LibRaw-$pkgver
  make DESTDIR="$pkgdir" install
}
