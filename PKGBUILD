# Maintainer: Ziyao <ziyao@disroot.org>

pkgbase=x265
pkgname=(libx265 x265)
epoch=1
pkgver=4.2
pkgrel=1
pkgdesc_libx265="x265/HEVC video coding library"
pkgdesc_x265="video encoder for the H.265/HEVC standard"
url="https://www.videolan.org/developers/x265.html"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(nasm cmake samurai git)
source=(
  "https://bitbucket.org/multicoreware/x265_git/downloads/x265_$pkgver.tar.gz"
)
sha256sums=('40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210')

build() {
	cmake x265_$pkgver/source -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release		\
		-DGIT_FOUND=True
	cmake --build build
	DESTDIR=fake cmake --install build
}

package_x265() {
	depends+=(libx265)
	mkdir -p "$pkgdir"/usr
	mv fake/usr/bin "$pkgdir"/usr
}

package_libx265() {
	provides=(libx265.so)
	mkdir -p "$pkgdir"/usr
	mv fake/usr/{lib,include} "$pkgdir"/usr
}
