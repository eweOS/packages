# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=android-tools
pkgver=36.0.1
pkgrel=2
pkgdesc='Android platform tools'
url='http://tools.android.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(brotli fmt libusb pcre2 protobuf googletest zstd python abseil-cpp)
optdepends=('python: mkbootimg, unpack_bootimg and repack_bootimg support')
makedepends=(cmake go perl linux-headers)
source=("https://github.com/nmeum/android-tools/releases/download/$pkgver/android-tools-$pkgver.tar.xz")
sha256sums=('38e8a84b739480141de0836bf6d581b3339ac7d53d0f7ce8c044a3368c8c2f8f')

build () {
	# use bundled libusb since android-tools depends on unreleased libusb
	# API
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DANDROID_TOOLS_USE_BUNDLED_LIBUSB=ON

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
