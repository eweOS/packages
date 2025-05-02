# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wmenu
pkgver=0.2.0
pkgrel=1
pkgdesc='dmenu substitution on Wayland'
url='https://codeberg.org/adnano/wmenu'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(MIT)
depends=(cairo pango wayland wayland-protocols libxkbcommon)
makedepends=(meson samurai scdoc)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('4e6aea3f8975fec720f6eb87aad620d5297a8a5a137615e4cf047e95d2b9d308')

build () {
	ewe-meson wmenu build \
		--buildtype=release
	meson compile -C build
}

# no check

package() {
	meson install -C build --destdir $pkgdir
}
