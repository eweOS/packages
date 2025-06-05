# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libslirp
pkgver=4.9.1
pkgrel=1
pkgdesc='A general purpose TCP-IP emulator.'
url='https://gitlab.freedesktop.org/slirp/libslirp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(glib)
makedepends=(meson ninja linux-headers)
provides=(libslirp.so)
source=("https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$pkgver/libslirp-v$pkgver.tar.gz")
sha256sums=('3970542143b7c11e6a09a4d2b50f30a133473c41f15ed0bdcc3b7a1c450d9a5c')

build () {
	mkdir -p build
	ewe-meson libslirp-v$pkgver build \
		-D static=false
	meson compile -C build
}

package() {
	meson install -C build --destdir $pkgdir
	_install_license_ libslirp-v$pkgver/COPYRIGHT
}
