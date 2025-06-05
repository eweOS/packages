# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.0.16
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
makedepends=(git)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('103ad98bbfbee5e93011c5197c9106ce849e2479e3ce2a49edf5882b15654015')

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

# Remove useless tests binary
  rm "$pkgdir"/usr/bin/tests
}

