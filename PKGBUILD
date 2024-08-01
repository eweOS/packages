# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yasm
pkgver=1.3.0
pkgrel=2
pkgdesc="A rewrite of NASM to allow for multiple syntax supported (NASM, TASM, GAS, etc.)"
arch=(x86_64 aarch64 riscv64)
url="https://www.tortall.net/projects/yasm/"
license=('BSD' 'GPL2' 'LGPL2.1' 'PerlArtistic')
options=('staticlibs')
source=(https://www.tortall.net/projects/yasm/releases/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f')

prepare() {
  cp /usr/share/autoconf/build-aux/config.{guess,sub} \
  	${pkgname}-${pkgver}/config
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check -j1
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/BSD.txt"
}
