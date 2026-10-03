# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libuninameslist
pkgver=20260918
pkgrel=1
pkgdesc='Large, sparse array mapping each unicode code point to the annotation data for it'
url='https://github.com/fontforge/libuninameslist'
license=('BSD-3-Clause')
arch=('x86_64' 'aarch64' 'riscv64' 'loongarch64')
source=("https://github.com/fontforge/${pkgname}/releases/download/${pkgver}/${pkgname}-dist-${pkgver}.tar.gz")
sha256sums=('deb2ec02640c232a4bc333c2cd301ee6b286914eeeb0ccc31ccafe326aed0029')

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
