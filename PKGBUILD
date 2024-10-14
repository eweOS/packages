# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=vulkan-volk
pkgver=1.3.295
pkgrel=1
pkgdesc='Meta loader for Vulkan API'
url='https://github.com/zeux/volk'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(musl)
makedepends=(cmake vulkan-headers)
source=("https://github.com/zeux/volk/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aea9f09c49f8a4e36738003c7aa5f08f99d68b96e4028ad9fa9039d2ee9fb251')

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
