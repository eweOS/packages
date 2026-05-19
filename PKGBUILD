# Maintainer: Yukari Chiba <i@0x7f.cc>

_pkgname=libqrencode
pkgname=qrencode
pkgver=4.1.1
pkgrel=3
pkgdesc="C library for encoding data in a QR Code symbol."
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=('libpng')
makedepends=(sdl2 autoconf git)
url="https://fukuchi.org/works/qrencode/"
license=('GPL')
source=("git+https://github.com/fukuchi/libqrencode#tag=v$pkgver")
sha256sums=('0151f34aa6996aefb0a3d011ce050bf32c70c5644055d8c82dcaa8044332ad35')

prepare() {
  cd "$_pkgname"
  autoreconf -fiv
}

build() {
  cd "$_pkgname"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgname"
  make check
}

package() {
  cd "$_pkgname"
  make prefix="$pkgdir/usr" install
}
