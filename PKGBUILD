# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=(dtc libfdt)
pkgver=1.7.2
pkgrel=1
pkgdesc='The device-tree compiler'
url='https://git.kernel.org/pub/scm/utils/dtc/dtc.git/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD GPL2)
depends=(musl)
makedepends=(flex bison meson ninja)
source=("https://git.kernel.org/pub/scm/utils/dtc/dtc.git/snapshot/dtc-$pkgver.tar.gz")
sha256sums=('8f1486962f093f28a2f79f01c1fd82f144ef640ceabe555536d43362212ceb7c')

build () {
	cd dtc-$pkgver
	local meson_options=(
		-D yaml=disabled
		-D valgrind=disabled
		-D python=disabled
		-D static-build=false
	)
	ewe-meson . build ${meson_options[*]}
	meson compile -C build
	DESTDIR=$srcdir/install meson install -C build
}

package_libfdt() {
	provides=(libfdt.so)
	license=(BSD GPL2)
	mkdir -p $pkgdir/usr
	cp -r $srcdir/install/usr/{include,lib} $pkgdir/usr/
	_install_license_ $srcdir/dtc-$pkgver/BSD-2-Clause
}

package_dtc() {
	depends=(libfdt)
	license=(GPL2)
	mkdir -p $pkgdir/usr
	cp -r $srcdir/install/usr/bin $pkgdir/usr/bin
}
