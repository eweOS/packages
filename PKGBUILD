# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=vulkan-volk
pkgver=1.4.341.0
pkgrel=1
pkgdesc='Meta loader for Vulkan API'
url='https://github.com/zeux/volk'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(musl)
makedepends=(cmake vulkan-headers)
source=("https://github.com/zeux/volk/archive/refs/tags/vulkan-sdk-$pkgver.tar.gz")
sha256sums=('42df539c70ffdaea259e317aef73524512f4093f6f4dafb36fa6cf2680c823b9')

build () {
	cmake -S "volk-vulkan-sdk-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=RelWithDebInfo	\
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DVOLK_INSTALL=ON			\
		-DVOLK_HEADERS_ONLY=ON

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	_install_license_ "volk-vulkan-sdk-$pkgver"/LICENSE.md
}
