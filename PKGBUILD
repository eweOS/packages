# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=android-tools
pkgver=37.0.0
pkgrel=1
pkgdesc='Android platform tools'
url='http://tools.android.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(brotli fmt libusb pcre2 protobuf zstd python abseil-cpp)
optdepends=('python: mkbootimg, unpack_bootimg and repack_bootimg support')
makedepends=(cmake go googletest perl linux-headers bsd-compat-headers)
source=("https://github.com/nmeum/android-tools/releases/download/$pkgver/android-tools-$pkgver.tar.xz")
sha256sums=('2725d09f892a3a38e534429f47a321f58ecf6a3169caa42c915fb2cb7d46be0e')

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
