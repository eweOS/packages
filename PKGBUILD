# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cabextract
pkgver=1.12
pkgrel=1
pkgdesc='A program to extract Microsoft cabinet (.CAB) files'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL)
url=https://www.cabextract.org.uk/
makedepends=(git)
source=("git+https://github.com/kyz/libmspack.git#tag=v${pkgver}")
sha256sums=('4c2c02daf1ab18d4fb9a7e0d5500113395969e213d292fef25c411004d79f004')

prepare() {
  cd libmspack/cabextract
  ./autogen.sh
}

build() {
  cd libmspack/cabextract
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man
  make
}

package() {
  make DESTDIR="${pkgdir}" -C libmspack/cabextract install
}
