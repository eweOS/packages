# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wmenu
pkgver=0.2.0
pkgrel=3
pkgdesc='dmenu substitution on Wayland'
url='https://codeberg.org/adnano/wmenu'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(cairo glib libxkbcommon musl pango wayland)
makedepends=(meson scdoc wayland-protocols)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('b1b593a80310085a90bd349d458ffbcfacf875d74468ae4428bdf5692a671ef9')

build () {
	ewe-meson wmenu build \
		--buildtype=release
	meson compile -C build
}

# no check

package() {
	meson install -C build --destdir $pkgdir
}
