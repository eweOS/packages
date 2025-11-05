# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=dav1d
pkgver=1.5.2
pkgrel=1
pkgdesc='A new open-source AV1 decoder.'
url='https://www.videolan.org/projects/dav1d.html'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-2-Clause)
depends=(musl xxhash)
makedepends=(meson ninja nasm)
provides=(libdav1d.so)
source=("https://downloads.videolan.org/pub/videolan/dav1d/$pkgver/dav1d-$pkgver.tar.xz")
sha256sums=('cce88ebcffd3f790bde49caa75f97b9cc2dd54ca8f57e38c62707266ec71bc4e')

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
