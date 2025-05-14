# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprland-protocols
pkgver=0.6.4
pkgrel=1
pkgdesc='Wayland protocol extensions for Hyprland'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
makedepends=(meson)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0d4f99abc21b04fc126dd754e306bb84cd334131d542ff2e0c172190c6570384')

build() {
	ewe-meson "$_archive" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
