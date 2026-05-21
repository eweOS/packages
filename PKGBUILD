# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=gweather-locations
pkgver=2026.2
pkgrel=2
pkgdesc='Location database for gweather'
url='https://gitlab.gnome.org/GNOME/gweather-locations'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
options=(!strip)
makedepends=(meson ninja python-gobject)
source=("https://gitlab.gnome.org/GNOME/gweather-locations/-/archive/$pkgver/gweather-locations-$pkgver.tar.gz")
sha256sums=('b1c30d19279e8603ac1405f033ad4cd49d84e30828facfb73b77064aff088e15')

build() {
	ewe-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir="$pkgdir"
}
