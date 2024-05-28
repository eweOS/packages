# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libslirp
pkgver=4.8.0
pkgrel=1
pkgdesc='A general purpose TCP-IP emulator.'
url='https://gitlab.freedesktop.org/slirp/libslirp'
arch=(x86_64 aarch64 riscv64)
license=(BSD-3-Clause)
depends=(glib)
makedepends=(meson ninja linux-headers)
provides=(libslirp.so)
source=("https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$pkgver/libslirp-v$pkgver.tar.gz")
sha256sums=('2a98852e65666db313481943e7a1997abff0183bd9bea80caec1b5da89fda28c')

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
