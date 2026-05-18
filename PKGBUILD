# Maintainer: Ziyao <ziyao@disroot.org>

pkgbase=x265
pkgname=(libx265 x265)
epoch=1
pkgver=4.1
pkgrel=2
pkgdesc_libx265="x265/HEVC video coding library"
pkgdesc_x265="video encoder for the H.265/HEVC standard"
url="https://www.videolan.org/developers/x265.html"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(nasm cmake samurai git)
source=(
  "https://bitbucket.org/multicoreware/x265_git/downloads/x265_$pkgver.tar.gz"
  "cmake-4-1.patch::https://bitbucket.org/multicoreware/x265_git/commits/b354c009a60bcd6d7fc04014e200a1ee9c45c167/raw"
  "cmake-4-2.patch::https://bitbucket.org/multicoreware/x265_git/commits/51ae8e922bcc4586ad4710812072289af91492a8/raw"
  "cmake-4-3.patch::https://bitbucket.org/multicoreware/x265_git/commits/78e5ac35c13c5cbccc5933083edceb0d3eaeaa21/raw"
)
sha256sums=('a31699c6a89806b74b0151e5e6a7df65de4b49050482fe5ebf8a4379d7af8f29'
            'dabf94104214c42e794cd30c505c26d730e6716e65329ce6db518135b5926454'
            'd00f2c38c70ab0e947539c44654236b690c45100411969b3325b9352289a9414'
            'ca6e5354ec82f4ffff8e7cfc62be9d112cb6cc7329d4bc84176800faa824fa61')

prepare() {
	_patch_ x265_$pkgver
}

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
