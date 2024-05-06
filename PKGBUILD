# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libdispatch
pkgver=5.10
pkgrel=1
pkgdesc='Library for concurrency on multicore hardware.'
url='https://github.com/apple/swift-corelibs-libdispatch'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0)
depends=(musl)
provides=(libdispatch.so)
source=("https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-$pkgver-RELEASE.tar.gz"
	disable-werror.patch
	fix-getprogname.patch)
sha256sums=('16e088cf12654d22658879710b9694a6fad1c94d5e5d0c597741b71fbcb3e034'
            '658f38a4afb9ebeff4acafb393cfeecfc381ab0b7a0e49a0d2c4f7a8ada58dd5'
            'd579d0aa5f20f211c4e4cf25f988c6788d5324f6002438679d3d266cb4bec1f2')

prepare() {
	_patch_ swift-corelibs-libdispatch-swift-$pkgver-RELEASE
}

build () {
	cmake swift-corelibs-libdispatch-swift-$pkgver-RELEASE -B build \
		-DCMAKE_INSTALL_PREFIX=/usr	\
		-DBUILD_TESTING=ON		\
		-DBUILD_SHARED_LIBS=ON
	cmake --build build
}

check() {
	ctest --test-dir build \
		-E dispatch_select
}

package() {
	DESTDIR=$pkgdir cmake --install build
	_install_license_ swift-corelibs-libdispatch-swift-$pkgver-RELEASE/LICENSE
}
