# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraw
pkgver=0.22.2
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
sha256sums=('de86b035655accff8d4010f1a221fdf50d353cb7b1422ba26f14a0db92612cfa')

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
