# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ell
pkgver=0.69
pkgrel=1
pkgdesc='Embedded Linux library'
url='https://git.kernel.org/pub/scm/libs/ell/ell.git/about/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(musl)
makedepends=(linux-headers)
provides=(libell.so)
source=("git+https://git.kernel.org/pub/scm/libs/ell/ell.git#tag=$pkgver")
sha256sums=('578ed5b73f596cfbea60076b2495caeafcbd056ea5cbb64502a53cbe50e419a9')

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
