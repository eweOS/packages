# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprlang
pkgver=0.6.3
pkgrel=1
pkgdesc='implementation library for the hypr config language'
arch=(x86_64 aarch64 riscv64 loongarch64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD)
depends=(musl hyprutils)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('f5effe017edc7a0036c20c7ecbea4edc2bfdacbc0f791b283bd21ec202384251')

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
