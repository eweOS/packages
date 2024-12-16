# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libspatialite
pkgver=5.1.0
pkgrel=1
pkgdesc="SQLite extension to support spatial data types and operations"
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://www.gaia-gis.it/fossil/libspatialite"
license=(MPL GPL LGPL)
depends=(geos libfreexl librttopo libxml2 minizip proj sqlite)
makedepends=(autoconf)
source=(
  "https://www.gaia-gis.it/gaia-sins/libspatialite-sources/libspatialite-$pkgver.tar.gz"
  0001-wfs-Cover-xmlNanoHTTPCleanup-with-LIBXML_HTTP_ENABLE.patch
)
sha256sums=('43be2dd349daffe016dd1400c5d11285828c22fea35ca5109f21f3ed50605080'
            '354fd842dbc295fc45d73b34078c7f71c25ec72a3ae3b302fd170374ad51e20a')

prepare() {
  _patch_ $pkgname-$pkgver
  cd $pkgname-$pkgver
  autoreconf -fiv
  sed -i '1i #include <libxml/nanohttp.h>' src/wfs/wfs_in.c
}

build() {
  cd $pkgname-$pkgver
  # use libtool
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  # use libtool
  MAKEFLAGS="CC=cc CXX=c++ -j$JOBS"
  make DESTDIR="${pkgdir}" install
}
