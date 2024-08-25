# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ell
pkgver=0.68
pkgrel=1
pkgdesc='Embedded Linux library'
url='https://git.kernel.org/pub/scm/libs/ell/ell.git/about/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(musl)
makedepends=(linux-headers)
provides=(libell.so)
source=("git+https://git.kernel.org/pub/scm/libs/ell/ell.git#tag=$pkgver")
sha256sums=('593e260b6ae480b7357253e9d03b7c5d54fb62f404e08fe33a998683ccad8778')

prepare() {
	# disable unit/test-path because of glibc-style basename()
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-path//g'

	# disable dbus-related tests: random failures
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-dbus[a-z-]*//g'
}

build () {
	cd "$pkgname"

	mkdir build-aux
	autoreconf -ivf

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"

	make check
}

package() {
	cd "$pkgname"

	make install DESTDIR="$pkgdir"
}
