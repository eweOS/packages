# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libde265
pkgver=1.0.15
pkgrel=1
pkgdesc='Open h.265 video codec implementation'
arch=(x86_64 aarch64 riscv64)
url='https://github.com/strukturag/libde265'
license=(LGPL-3.0-or-later)
makedepends=(git)
source=(git+https://github.com/strukturag/libde265#tag=v$pkgver)
sha256sums=('fc1d3e6e13eae5599070bf469ef4b7edb74efad6831df6fba461779e3293bbd7')

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

