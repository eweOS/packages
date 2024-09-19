# Maintainer: Ziyao <ziyao@disroot.org>

pkgbase=x265
pkgname=(libx265 x265)
epoch=1
pkgver=4.0
pkgrel=1
pkgdesc_libx265="x265/HEVC video coding library"
pkgdesc_x265="video encoder for the H.265/HEVC standard"
url="https://www.videolan.org/developers/x265.html"
arch=(x86_64 aarch64 riscv64)
license=(GPL2)
depends=(musl)
makedepends=(nasm cmake samurai)
source=("https://bitbucket.org/multicoreware/x265_git/downloads/x265_$pkgver.tar.gz")
sha256sums=('75b4d05629e365913de3100b38a459b04e2a217a8f30efaa91b572d8e6d71282')

build() {
	cmake x265_$pkgver/source -B build -G Ninja \
		-DCMAKE_INSTALL_PREFIX=/usr		\
		-DCMAKE_BUILD_TYPE=Release
	cmake --build build
	DESTDIR=fake cmake --install build
}

package_x265() {
	depends+=(libx265)
	mkdir -p $pkgdir/usr/share/licenses/x265
	mv fake/usr/bin $pkgdir/usr
}

package_libx265() {
	provides=(libx265.so)
	mkdir -p $pkgdir/usr/share/licenses/libx265
	mv fake/usr/{lib,include} $pkgdir/usr
	_install_license_ x265_$pkgver/COPYING
}
