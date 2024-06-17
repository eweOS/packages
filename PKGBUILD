# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libraw
pkgver=0.21.2
pkgrel=1
pkgdesc='A library for reading RAW files obtained from digital photo cameras (CRW/CR2, NEF, RAF, DNG, and others)'
arch=(x86_64 aarch64 riscv64)
url='https://www.libraw.org/'
license=(CDDL LGPL)
depends=(lcms2
         libjpeg
         zlib)
source=(https://www.libraw.org/data/LibRaw-$pkgver.tar.gz)
sha256sums=('fe7288013206854baf6e4417d0fb63ba4ed7227bf36fff021992671c2dd34b03')

build() {
  cd LibRaw-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd LibRaw-$pkgver
  make DESTDIR="$pkgdir" install
}
