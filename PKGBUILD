# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprland-protocols
pkgver=0.8.0
pkgrel=1
pkgdesc='Wayland protocol extensions for Hyprland'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
makedepends=(meson)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e41ab206d89259fdf2059fdc523c39133e23ed9efa8b0ef0de9aeed61be96e72')

build() {
	ewe-meson "$_archive" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
