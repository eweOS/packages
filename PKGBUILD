# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libfreexl
pkgver=2.0.0
pkgrel=1
pkgdesc="Library to extract valid data from within an Excel (.xls) spreadsheet"
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
url="https://www.gaia-gis.it/fossil/freexl/index"
license=('MPL' 'GPL' 'LGPL')
depends=('minizip' 'expat')
makedepends=('autoconf')
source=(https://www.gaia-gis.it/gaia-sins/${pkgname/lib/}-$pkgver.tar.gz)
sha256sums=('176705f1de58ab7c1eebbf5c6de46ab76fcd8b856508dbd28f5648f7c6e1a7f0')

prepare() {
  cd "${srcdir}"/${pkgname/lib/}-$pkgver
  autoreconf -fiv
}

build() {
  cd "${srcdir}"/${pkgname/lib/}-$pkgver
  # use libtool
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname/lib/}-$pkgver
  # use libtool
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  make DESTDIR="${pkgdir}" install
}
