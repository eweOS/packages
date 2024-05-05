# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=openh264
pkgver=2.4.1
pkgrel=1
pkgdesc='Open Source H264 Codec'
url='https://github.com/cisco/openh264'
arch=(x86_64 aarch64)
license=(BSD)
depends=(musl)
makedepends=(meson ninja nasm)
checkdepends=(googletest)
provides=(libopenh264.so)
source=("https://github.com/cisco/openh264/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ffbe944e74043d0d3fb53d4a2a14c94de71f58dbea6a06d0dc92369542958ea')

build () {
	mkdir -p build
	ewe-meson configure openh264-$pkgver \
		-Dtests=enabled
	meson compile -C build
}

check() {
	meson test -C build --timeout 0
}

package() {
	meson install -C build --destdir $pkgdir
	_install_license_ openh264-$pkgver/LICENSE
}
