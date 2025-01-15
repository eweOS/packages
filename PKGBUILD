# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=vulkan-volk
pkgver=1.4.304
pkgrel=1
pkgdesc='Meta loader for Vulkan API'
url='https://github.com/zeux/volk'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake vulkan-headers)
source=("https://github.com/zeux/volk/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ab3d4a8ccaeb32652259cdd008399504a41792675b0421d90b67729ee274746f')

build () {
	cmake -S "volk-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DVOLK_INSTALL=ON			\
		-DVOLK_HEADERS_ONLY=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "volk-$pkgver"/LICENSE.md
}
