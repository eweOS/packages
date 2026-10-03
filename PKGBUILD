# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libslirp
pkgver=4.9.5
pkgrel=1
pkgdesc='A general purpose TCP-IP emulator.'
url='https://gitlab.freedesktop.org/slirp/libslirp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(glib)
makedepends=(meson ninja linux-headers)
provides=(libslirp.so)
source=("https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$pkgver/libslirp-v$pkgver.tar.gz")
sha256sums=('f43e68b60b580647574ec4a0e2b6c600a56281e6c39f79426510832dc810f483')

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
