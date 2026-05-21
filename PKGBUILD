# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuninameslist
pkgver=20260107
pkgrel=2
pkgdesc='Large, sparse array mapping each unicode code point to the annotation data for it'
url='https://github.com/fontforge/libuninameslist'
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
source=("https://github.com/fontforge/${pkgname}/releases/download/${pkgver}/${pkgname}-dist-${pkgver}.tar.gz")
sha256sums=('aadfaf62a96f20914d8dd248e8f19325471ead0cf3133b2f8ae0624c2da3657b')

prepare() {
  cd ${pkgname}-${pkgver}
  autoreconf -i
  automake --foreign -Wall
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  _install_license_ LICENSE
}
