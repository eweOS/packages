# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=wmenu
pkgver=0.1.7
pkgrel=1
pkgdesc='dmenu substitution on Wayland'
url='https://sr.ht/~adnano/wmenu/'
arch=(x86_64 aarch64 riscv64)
license=(MIT)
depends=(cairo pango wayland wayland-protocols libxkbcommon)
makedepends=(meson samurai scdoc)
source=("https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz")
sha256sums=('f86c9bfb32a907d467c59d34123c8e7d55cda08524735b7c640b682830f854b9')

build () {
	ewe-meson wmenu-$pkgver build \
		--buildtype=release
	meson compile -C build
}

# no check

package() {
	meson install -C build --destdir $pkgdir
}
