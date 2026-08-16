# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=doxygen
pkgname=(doxygen doxywizard)
pkgver=1.18.0
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc='Tool for generating documentation from annotated sources'
url='https://www.doxygen.nl'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
makedepends=(cmake clang llvm fmt spdlog sqlite qt6-base libglvnd llvm-devel
	     qt6-svg)
checkdepends=(perl python)
source=("https://github.com/doxygen/doxygen/archive/refs/tags/Release_$_pkgver.tar.gz")
sha256sums=('b32a3def78b0b75a2fd74ee6a63fb4a79cb6273fe31a570362e4e1871fa446da')

build() {
	# TODO:
	#	doxysearch: missing Xapian
	#	docs: require tex
	cmake -S "$pkgname-Release_$_pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-Dbuild_wizard=ON			\
		-Dbuild_parse=ON			\
		-Dbuild_search=OFF			\
		-Dbuild_doc=OFF				\
		-Duse_libclang=ON			\
		-Duse_sys_spdlog=ON			\
		-Duse_sys_fmt=ON			\
		-Duse_sys_sqlite3=ON			\
		-Dstatic_libclang=OFF			\
		-Denable_coverage=OFF			\
		-Denable_tracing=OFF			\
		-Denable_lex_debug=OFF			\
		-DENABLE_CLANG_TIDY=OFF

	cmake --build build

	DESTDIR="$srcdir/install" cmake --install build
	cd "$srcdir/install"

	_pick_ doxywizard usr/bin/doxywizard usr/share/man/man1/doxywizard.1
}

check() {
	# 012_cite: Missing bibtex, skip it.
	ctest --test-dir build -VV -E 012_cite
}

package_doxygen() {
	depends=(musl llvm-libs llvm clang fmt graphviz spdlog sqlite)

	mv "$srcdir"/install/* "$pkgdir"
}

package_doxywizard() {
	pkgdesc="$pkgdesc (GUI frontend)"
	depends=(musl llvm-libs libglvnd qt6-base qt6-svg doxygen="$pkgver")

	mv "$srcdir"/pkgs/doxywizard/* "$pkgdir"
}
