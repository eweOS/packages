# Maintainer: Yao Zi <me@ziyao.cc>

# Originally this is distributed on https://www.salome-platform.org/, but
# upstream has disappeared.
# However, at least FreeCAD still depends on it. Currently it's built from a
# fork.

pkgname=(med med-doc)
pkgver=5.0.0
pkgrel=2
pkgdesc='Library for exchanging multi-physics simulation data'
url='https://github.com/chennes/med'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-3.0-or-later GPL-3.0-or-later)
depends=(musl llvm-libs hdf5)
makedepends=(cmake flang doxygen)
provides=(libmed.so libmedC.so libmedfwrap.so libmedimport.so)
# 0001: Should be upstreamed (who's the upstream now?), allow HDF5 2.x to be
#	used
source=("https://github.com/chennes/med/archive/refs/tags/v$pkgver.tar.gz"
	0001-Fix-HDF5-version-check.patch)
sha256sums=('8701f142087b87e8b74958fd0432498eadf28011b20ad05cf56bf911be081888'
            'e6f2a160290cd433bac772c492e1f15febe824842da01d4ba547d3422852152c')

prepare() {
	_patch_ "$pkgname-$pkgver"
}

build() {
	# Enable Python binding if used somewhere. Note the binding fails to
	# build with Swig 14.
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DMEDFILE_BUILD_TESTS=ON		\
		-DMEDFILE_BUILD_STATIC_LIBS=OFF		\
		-DMEDFILE_BUILD_DOC=ON			\
		-DMEDFILE_BUILD_PYTHON=OFF

	cmake --build build
	DESTDIR="$srcdir/tmpinstall" cmake --install build

	cd tmpinstall
	rm -r usr/bin/test{c,f}		# Remove tests
	_pick_ med-doc usr/share/doc
}

check() {
	ctest --test-dir build
}

package_med() {
	mv "$srcdir/tmpinstall"/* "$pkgdir"
}

package_med-doc() {
	depends=()
	pkgdesc+=" (Documentation)"
	options+=(!strip)

	mv "$srcdir/pkgs/med-doc/usr" "$pkgdir"
}
