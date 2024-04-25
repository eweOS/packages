# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wlr-randr
pkgver=0.4.1
pkgrel=1
pkgdesc="Utility to manage outputs of a Wayland compositor"
url='https://git.sr.ht/~emersion/wlr-randr'
arch=(x86_64 aarch64 riscv64)
license=('MIT')
depends=('wayland')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8af085aeed3132f7442a05bafeadfd0ea30e9a4818af1a91e161f7d560f2cd93')

build() {
	cd "${pkgname}-v${pkgver}"
	ewe-meson build
	meson compile -C build
}

package() {
	cd "${pkgname}-v${pkgver}"
	meson install -C build --destdir "${pkgdir}"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
