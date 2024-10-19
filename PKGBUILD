# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libndp
pkgver=1.9
pkgrel=2
pkgdesc="Library for Neighbor Discovery Protocol"
url="http://libndp.org/"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
makedepends=(git)
source=("git+https://github.com/jpirko/libndp#tag=v$pkgver")
sha256sums=('6f863dfa99c750675be6a4ae6683456a16e059ad7558bc2bfaecb57f0326cac1')

prepare() {
  cd libndp
  ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --libexecdir=/usr/lib
    --disable-static
  )

  cd libndp
  ./configure "${configure_options[@]}"
  make
}

check() {
  cd libndp
  make check
}

package() {
  cd libndp
  make DESTDIR="$pkgdir" install
}
