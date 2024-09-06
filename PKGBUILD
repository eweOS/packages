# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=cabextract
pkgver=1.11
pkgrel=1
pkgdesc='A program to extract Microsoft cabinet (.CAB) files'
arch=(x86_64 aarch64 riscv64)
license=(GPL)
url=https://www.cabextract.org.uk/
makedepends=(git)
source=("git+https://github.com/kyz/libmspack.git#tag=v${pkgver}")
sha256sums=('8772ea127d0e09f6ae60e7780634fbf0467e26fa0dc429bc207395b0117c447a')

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
