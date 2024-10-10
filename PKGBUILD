# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=android-tools
pkgver=35.0.2
pkgrel=1
pkgdesc='Android platform tools'
url='http://tools.android.com/'
arch=(x86_64 aarch64 riscv64)
license=(Apache-2.0 MIT)
depends=(brotli libusb pcre2 protobuf googletest zstd python abseil-cpp)
optdepends=('python: mkbootimg, unpack_bootimg and repack_bootimg support')
makedepends=(cmake go perl linux-headers)
source=("https://github.com/nmeum/android-tools/releases/download/$pkgver/android-tools-$pkgver.tar.xz")
sha256sums=('d2c3222280315f36d8bfa5c02d7632b47e365bfe2e77e99a3564fb6576f04097')

build () {
	cmake -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr

	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "$pkgname-$pkgver"/LICENSE
}
