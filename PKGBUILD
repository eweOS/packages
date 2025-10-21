# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprland-protocols
pkgver=0.7.0
pkgrel=1
pkgdesc='Wayland protocol extensions for Hyprland'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
makedepends=(meson)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('ee419006d7cd20927b9b7c8b5fc430571c151b0385d600508de1a7957294498c')

build() {
	ewe-meson "$_archive" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
