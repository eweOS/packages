# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rapidjson
pkgver=1.1.0
pkgrel=1
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API'
url='https://github.com/Tencent/rapidjson'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
source=("https://github.com/Tencent/rapidjson/archive/refs/tags/v$pkgver.tar.gz"
	"remove-march-and-error-related-flags.patch")
sha256sums=('bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e'
            '9f127215c1a696667f1c893908a9589e99994c6a6b443655acc085145c299119')

# TODO: Enable tests

prepare() {
	cd rapidjson-$pkgver
	patch -p1 < $srcdir/remove-march-and-error-related-flags.patch
}

build () {
	cd rapidjson-$pkgver
	export CXXFLAGS="-Wno-error $CXXFLAGS"
	cmake . -B build	\
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DRAPIDJSON_BUILD_CXX11=ON
	cmake --build build
}

package() {
	cd rapidjson-$pkgver
	DESTDIR=$pkgdir cmake --install build
	_install_license_ license.txt
}

