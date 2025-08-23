# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ngspice
pkgver=44.2
pkgrel=1
pkgdesc='Spice simulator for electric and electronic circuits'
url='https://ngspice.sourceforge.io/index.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs openmp)
provides=(libngspice.so)
# 0001: Should be upstreamed, libc++ doesn't allow redefine system library
#	templates
source=("https://sourceforge.net/projects/ngspice/files/ng-spice-rework/$pkgver/ngspice-$pkgver.tar.gz"
	0001-Skip-instantiation-for-is_compound.patch)
sha256sums=('e7dadfb7bd5474fd22409c1e5a67acdec19f77e597df68e17c5549bc1390d7fd'
            'b505d8f13c1fe40364c7ea47406308d4704c320d589368cc443baf5205501c4c')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	local _common_flags=(
		--prefix=/usr
		--without-x
		--mandir=/usr/share/man
		--infodir=/usr/share/info
		--enable-openmp
		--disable-debug)

	mkdir -p build-lib
	cd build-lib
	../"$pkgname-$pkgver"/configure "${_common_flags[@]}" \
		--with-ngshared
	make

	cd "$srcdir"

	mkdir -p build-exe
	cd build-exe
	../"$pkgname-$pkgver"/configure "${_common_flags[@]}"
	make
}

check() {
	cd build-exe

	make check
}

package() {
	cd "$srcdir"/build-exe
	make install DESTDIR="$pkgdir"

	cd "$srcdir"/build-lib
	make install DESTDIR="$pkgdir"

	cd "$srcdir/$pkgname-$pkgver"
	_install_license_ COPYING
}
