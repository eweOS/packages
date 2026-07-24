# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=giflib
pkgver=6.1.3
pkgrel=1
pkgdesc='Library for reading and writing gif images'
url='http://giflib.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('MIT')
provides=('libgif.so')
makedepends=('xmlto' 'docbook-xml' 'docbook-xsl')
source=(https://downloads.sourceforge.net/project/giflib/giflib-${pkgver%%.*}.x/${pkgname}-${pkgver}.tar.gz)
sha512sums=('fb1d6319694745e8cdac7c57e96bd3a87dbfd978f2bfd00e826742db53398011c43f9a6e7f4375b0e77b162358ddfa14d85bce652680fb5967b72c46775c0edb')
options=(!zipman)

prepare() {
  cd ${pkgname}-${pkgver}
  # FIXME: imagemagick
  sed -i 's|convert $^ -resize 50x50 $@|cp $^ $@|' doc/Makefile
  # fix busybox head command
  sed -i 's|--bytes=-20|-c -20|' tests/makefile
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
