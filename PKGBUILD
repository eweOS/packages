# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=dav1d
pkgver=1.5.5
pkgrel=1
pkgdesc='A new open-source AV1 decoder.'
url='https://www.videolan.org/projects/dav1d.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl xxhash)
makedepends=(meson ninja nasm)
provides=(libdav1d.so)
source=("https://downloads.videolan.org/pub/videolan/dav1d/$pkgver/dav1d-$pkgver.tar.xz")
sha256sums=('ca96b1d0ba3f01f55de7231d775892b64994ba061aaeeaaa4f662a390b3abf9e')

build () {
	local arch_options=()
	ewe-meson build dav1d-$pkgver \
		-Denable_tools=true		\
		-Denable_tests=true		\
		-Denable_examples=false		\
		-Denable_docs=false		\
		${arch_options[*]}
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir=$pkgdir
	_install_license_ dav1d-$pkgver/COPYING
}
