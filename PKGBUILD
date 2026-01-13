# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraw
pkgver=0.21.5
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
sha256sums=('a74a2e68303d3b9219f82318f935b28c5c4abd7f2c9f7dbf8faa4997c9038305')

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
