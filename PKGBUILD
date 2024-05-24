# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wmenu
pkgver=0.1.8
pkgrel=1
pkgdesc='dmenu substitution on Wayland'
url='https://sr.ht/~adnano/wmenu/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(cairo pango wayland wayland-protocols libxkbcommon)
makedepends=(meson samurai scdoc)
source=("https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz")
sha256sums=('0079d3bbe82e0b02035450b4b31609dd5b822116ea4c14979d2e26d91db3c461')

build () {
	ewe-meson wmenu-$pkgver build \
		--buildtype=release
	meson compile -C build
}

# no check

package() {
	meson install -C build --destdir $pkgdir
}
