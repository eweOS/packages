# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ell
pkgver=0.76
pkgrel=1
pkgdesc='Embedded Linux library'
url='https://git.kernel.org/pub/scm/libs/ell/ell.git/about/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
makedepends=(linux-headers git)
provides=(libell.so)
source=("git+https://git.kernel.org/pub/scm/libs/ell/ell.git#tag=$pkgver")
sha256sums=('d41f41e1ac7a11da3b39b45f94986c95571089a8ec754d64e69aa29a0091f5d1')

prepare() {
	# disable unit/test-path because of glibc-style basename()
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-path//g'

	# disable dbus-related tests: random failures
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-dbus[a-z-]*//g'

	# disable sysctl tests: may fail in container
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-sysctl//g'

	# disable hwdb tests: no udev, no hwdb.bin
	sed -i "$pkgname/Makefile.am" \
		-e 's/unit\/test-hwdb//g'

	# disable test-uuid: many riscv64 devices lack needed kernel config
	# https://bugs.gentoo.org/657352
	[ "$CARCH" != "riscv64" ] || \
		sed -i "$pkgname/Makefile.am" \
			-e 's/unit\/test-uuid//g'
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
