# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libudev
_pkgname=libudev-zero
pkgver=1.0.3
pkgrel=1
so_ver=1.6.3
pkgdesc="Daemonless replacement for libudev "
arch=(x86_64 aarch64 riscv64)
url="https://github.com/illiliti/libudev-zero"
license=('GPL')
makedepends=('musl' 'make')
provides=('libudev-zero' 'libeudev' 'libudev')
source=("https://github.com/illiliti/libudev-zero/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('5a96ce28acbfa2e5004a7451613115c0')

build() {
	cd ${_pkgname}-${pkgver}
	LIBUDEV_VER="${so_ver}" make CC=clang
	msg "Compiling helper"
	cd contrib
	clang $CFLAGS -o libudev-helper helper.c
}

package() {
	cd ${_pkgname}-${pkgver}
	LIBUDEV_VER="${so_ver}" make DESTDIR="${pkgdir}" PREFIX="/usr" install
	install -Dm755 contrib/libudev-helper "${pkgdir}"/usr/bin/libudev-helper
}
