# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wmenu
pkgver=0.1.9
pkgrel=1
pkgdesc='dmenu substitution on Wayland'
url='https://codeberg.org/adnano/wmenu'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(cairo pango wayland wayland-protocols libxkbcommon)
makedepends=(meson samurai scdoc)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1b457dfdbf8404748a036d8ee4fab1853d5dd28b132531321b7afc78e85bc1cd')

build () {
	ewe-meson wmenu build \
		--buildtype=release
	meson compile -C build
}

# no check

package() {
	meson install -C build --destdir $pkgdir
}
