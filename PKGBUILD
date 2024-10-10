# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraw
pkgver=0.21.3
pkgrel=2
pkgdesc='A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)'
arch=(x86_64 aarch64 riscv64)
url='https://www.libraw.org/'
license=(CDDL LGPL)
depends=(lcms2
         libjpeg
         zlib)
makedepends=(autoconf)
source=(https://www.libraw.org/data/LibRaw-$pkgver.tar.gz)
sha256sums=('dba34b7fc1143503942fa32ad9db43e94f714e62a4a856e91617f8f3e1e0aa5c')

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
