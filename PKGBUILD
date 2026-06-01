# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libudev
_pkgname=libudev-zero
pkgver=1.0.4
pkgrel=1
so_ver=1.6.3
pkgdesc="Daemonless replacement for libudev "
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/illiliti/libudev-zero"
license=('ISC')
makedepends=('musl' 'make' 'git' 'linux-headers')
provides=('libudev-zero' 'libeudev' 'libudev')
source=(
  "git+$url.git#tag=$pkgver"
  sound-initialized.patch
)
sha256sums=('d3548c35824b8d97914682d2812852319114e3e2a1f3b241ef3ebaee8ac18204'
            '934173ce6bb325d155116e2d023aea9cf004ae021b04d63ddde1e97ad1d61986')

prepare() {
  _patch_ ${_pkgname}
}

build() {
  cd ${_pkgname}
  LIBUDEV_VER="${so_ver}" make CC=clang
  msg "Compiling helper"
  cd contrib
  clang $CFLAGS -o libudev-helper helper.c
}

package() {
  cd ${_pkgname}
  LIBUDEV_VER="${so_ver}" make DESTDIR="${pkgdir}" PREFIX="/usr" install
  install -Dm755 contrib/libudev-helper "${pkgdir}"/usr/bin/libudev-helper
}
