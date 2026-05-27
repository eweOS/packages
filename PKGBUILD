# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libslirp
pkgver=4.9.3
pkgrel=1
pkgdesc='A general purpose TCP-IP emulator.'
url='https://gitlab.freedesktop.org/slirp/libslirp'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(glib)
makedepends=(meson ninja linux-headers)
provides=(libslirp.so)
source=("https://gitlab.freedesktop.org/slirp/libslirp/-/archive/v$pkgver/libslirp-v$pkgver.tar.gz")
sha256sums=('ee698ca4ce05217ca7d520c7f0b1b1228fd7d32922dd32d1051c347152588417')

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
