# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=kicad
pkgver=9.0.7
pkgrel=4
pkgdesc='Electronics design automation suite'
url='https://www.kicad.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-or-later)
depends=(musl llvm-libs wxwidgets-gtk3 boost-libs glew zlib-ng cairo python
	 curl protobuf libgit2 opencascade glu ngspice unixodbc abseil-cpp)
makedepends=(cmake swig boost glm)
# 0001: Backport for 3rd library nanodbc, fix build with libc++ 19 which
#	forbids arbitrary instantiation of std::char_traits<>
#	Upstream: https://github.com/nanodbc/nanodbc/pull/434
#	LLVM: https://reviews.llvm.org/D157058
# 0002: Downstream, remove options like --sort=name which isn't supported by
#	bsdtar
# 0003: Should be upstreamed, similar reason to 0001. KiCAD defines its own
#	std::char_traits<> equivalent but enables it for Apple only by default.
# 0004: Should be upstreamed, similar reason to 0003, but the original fix
#	doesn't take Linux systems with libc++ into account.
#	https://gitlab.com/kicad/code/kicad/-/issues/20631
#	https://gitlab.com/kicad/code/kicad/-/commit/a5be581b1b73294f52d85854b571c4959767f20b
source=("https://gitlab.com/kicad/code/kicad/-/archive/$pkgver/kicad-$pkgver.tar.gz"
	0001-Remove-std-char_traits-usage.patch
	0002-Remove-options-not-supported-by-bsdtar.patch
	0003-Define-our-own-char_traits-for-eweOS.patch
	0004-Enable-json-common-for-std-char_traits-with-wxUniChar.patch)
sha256sums=('4743c5504576794c02f7e884a79f3fb5d7ec0f1dd359371a9225e9f2913581c5'
            '125061fb75c8318f3779b1cd620d6b0b08b8724035c60ac8bb2b4582de7108b7'
            '50620a09a43705e61ac1322a2b421b222ab3f321be150731f12951e1fac8957e'
            '0b51717b6a983fc91ef74508ae23d135a22eb5cbf40a8cb61502f78dcb1ccf07'
            '4200643596a21371171c73bd902744b330a0eb136a52fe6635d6ae303c3937e3')

prepare() {
	cd "$pkgname-$pkgver"/thirdparty/nanodbc
	patch -p1 < "$srcdir"/0001-Remove-std-char_traits-usage.patch

	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 < "$srcdir"/0002-Remove-options-not-supported-by-bsdtar.patch
	patch -p1 < "$srcdir"/0004-Enable-json-common-for-std-char_traits-with-wxUniChar.patch

	cd "$srcdir/$pkgname-$pkgver/thirdparty/compoundfilereader"
	patch -p1 < "$srcdir"/0003-Define-our-own-char_traits-for-eweOS.patch
}

build() {
	# TODO:
	#	Enable the experimental IPC API (missing nanomsg)
	#	Enable wxPython scripting (missing wxpython)
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release		\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DKICAD_USE_EGL=ON			\
		-DKICAD_USE_BUNDLED_GLEW=OFF		\
		-DKICAD_BUILD_I18N=ON			\
		-DKICAD_I18N_UNIX_STRICT_PATH=ON	\
		-DKICAD_BUILD_QA_TESTS=OFF		\
		-DKICAD_SCRIPTING_WXPYTHON=OFF		\
		-DKICAD_IPC_API=OFF			\
		-DKICAD_SPICE=OFF			\
		-DKICAD_USE_OCC=OFF

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
