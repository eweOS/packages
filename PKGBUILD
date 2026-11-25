# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprland-protocols
pkgver=0.8.0
pkgrel=1
pkgdesc='Wayland protocol extensions for Hyprland'
arch=(any)
url="https://github.com/hyprwm/$pkgname"
license=(BSD-3-Clause)
makedepends=(cmake)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('e41ab206d89259fdf2059fdc523c39133e23ed9efa8b0ef0de9aeed61be96e72')

build() {
	cmake -B build -S "$_archive" -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$_archive"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
