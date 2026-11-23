# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=ngspice
pkgver=47
pkgrel=1
pkgdesc='Spice simulator for electric and electronic circuits'
url='https://ngspice.sourceforge.io/index.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl llvm-libs openmp)
provides=(libngspice.so)
source=("https://sourceforge.net/projects/ngspice/files/ng-spice-rework/$pkgver/ngspice-$pkgver.tar.gz")
sha256sums=('894e649651f1838a14095e5a5439e7d3aa63e87ede14d283173fda4fcdef675f')

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
