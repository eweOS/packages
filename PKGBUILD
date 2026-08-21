# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprlang
pkgver=0.6.8
pkgrel=6
pkgdesc='implementation library for the hypr config language'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD)
depends=(musl hyprutils)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('d10a0778b646e04d83e8b90cc0f764fb96958c01a15c3c0678d95a40fc647ed5')

build() {
	cd "$_archive"
	cmake -B build \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D CMAKE_BUILD_TYPE=Release \
		-D CMAKE_INSTALL_LIBDIR=lib
	cmake --build build
}

package() {
	cd "$_archive"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
