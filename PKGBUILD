# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.0.18
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64 loongarch64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
makedepends=(git)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('4794e574bde26e8e1dbe7e08bc1176e714056ba134e0987e2cc84d9a882b6e15')

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

