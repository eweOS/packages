# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=android-tools
pkgver=35.0.2
pkgrel=11
pkgdesc='Android platform tools'
url='http://tools.android.com/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(Apache-2.0 MIT)
depends=(brotli fmt libusb pcre2 protobuf googletest zstd python abseil-cpp)
optdepends=('python: mkbootimg, unpack_bootimg and repack_bootimg support')
makedepends=(cmake go perl linux-headers)
# 0001: downstream, fix compatibility with protobuf 30.0
source=("https://github.com/nmeum/android-tools/releases/download/$pkgver/android-tools-$pkgver.tar.xz"
	"0001-jsonpb-fix-compatibility-with-protobuf-30.patch")
sha256sums=('d2c3222280315f36d8bfa5c02d7632b47e365bfe2e77e99a3564fb6576f04097'
            'e4b18a51384505e90dbeebd9dc9280aaf3f3f40de138ee2b9839e0d26d1bdb97')

prepare() {
	cd "$pkgname-$pkgver/vendor/extras/libjsonpb"
	patch -p1 < "$srcdir/0001-jsonpb-fix-compatibility-with-protobuf-30.patch"
}

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
