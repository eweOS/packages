# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuninameslist
pkgver=20250909
pkgrel=1
pkgdesc='Large, sparse array mapping each unicode code point to the annotation data for it'
url='https://github.com/fontforge/libuninameslist'
license=('custom')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
source=("https://github.com/fontforge/${pkgname}/releases/download/${pkgver}/${pkgname}-dist-${pkgver}.tar.gz")
sha256sums=('27b5e9667b668ce8a1623ad0ad52a2b9eeaeef8eb7a206ed1e5e4f5ec0980c85')

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
}
