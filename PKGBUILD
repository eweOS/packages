# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=tclap
pkgname=(tclap tclap-doc)
pkgver=1.4.0
pkgrel=1
pkgdesc='A header-only templatized C++ command line parser library'
url='https://tclap.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake ninja)
checkdepends=(python)
source=("https://sourceforge.net/projects/tclap/files/tclap-$pkgver.tar.gz")
sha256sums=('413014a7e68740d9aa972a058532e3e9959b4af7509d6ae7b11a8c1828378567')

build() {
	cd tclap-$pkgver
	# The release tarball ships pre-generated docs; docs are installed from
	# the source tree in package_tclap-doc().
	cmake -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_DOC=OFF
	cmake --build build
}

check() {
	ctest --test-dir "tclap-$pkgver/build" --output-on-failure
}

package_tclap() {
	DESTDIR="$pkgdir" cmake --install "tclap-$pkgver/build"
	_install_license_ "$srcdir/tclap-$pkgver/COPYING"
}

package_tclap-doc() {
	install -d "$pkgdir/usr/share/doc/tclap"
	install -m644 \
		"$srcdir/tclap-$pkgver/docs/index.html" \
		"$srcdir/tclap-$pkgver/docs/manual.html" \
		"$srcdir/tclap-$pkgver/docs/style.css" \
		"$pkgdir/usr/share/doc/tclap/"
	cp -a "$srcdir/tclap-$pkgver/docs/html" "$pkgdir/usr/share/doc/tclap/"
}
