# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=rapidjson
pkgver=1.1.0
pkgrel=3
pkgdesc='A fast JSON parser/generator for C++ with both SAX/DOM style API'
url='https://github.com/Tencent/rapidjson'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake)
# 0001: Downstream, drop -march=native and error-related flags
# 0002: Backport, fix build with newer Clang
#	https://github.com/Tencent/rapidjson/commit/3b2441b87f99ab65f37b141a7b548ebadb607b96
source=("https://github.com/Tencent/rapidjson/archive/refs/tags/v$pkgver.tar.gz"
	0001-remove-march-and-error-related-flags.patch
	0002-Removed-non-compiling-assignment-operator.patch)
sha256sums=('bf7ced29704a1e696fbccf2a2b4ea068e7774fa37f6d7dd4039d0787f8bed98e'
            '9f127215c1a696667f1c893908a9589e99994c6a6b443655acc085145c299119'
            'a8b1fe3ac541792ef9173eb5d7ee0ce61b73c7212dfb79016df6e5d2b6bd5a93')

# TODO: Enable tests
prepare() {
	_patch_ rapidjson-$pkgver
}

build () {
	cd rapidjson-$pkgver
	export CXXFLAGS="-Wno-error $CXXFLAGS"
	cmake . -B build	\
		-DCMAKE_BUILD_TYPE=Release	\
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DRAPIDJSON_BUILD_CXX11=ON	\
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build build
}

package() {
	cd rapidjson-$pkgver
	DESTDIR=$pkgdir cmake --install build
	_install_license_ license.txt
}

