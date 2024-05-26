# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hyprlang
pkgver=0.5.2
pkgrel=1
pkgdesc='implementation library for the hypr config language'
arch=(x86_64 aarch64 riscv64)
url="https://github.com/hyprwm/$pkgname"
license=(BSD)
makedepends=(cmake)
provides=("lib$pkgname.so")
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('66a1f87634c8ecdeb67d7ccc499a3fc1c19b064a098b103be042751e7430b5cc')

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
