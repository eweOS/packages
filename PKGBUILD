# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsdl2
pkgver=2.26.3
pkgrel=1
pkgdesc="Simple DirectMedia Layer"
url="https://libsdl.org"
arch=(x86_64 aarch64)
license=('zlib')
depends=('musl' 'wayland' 'libudev' 'dbus' 'libsamplerate')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha256sums=('c661205a553b7d252425f4b751ff13209e5e020b876bbfa1598494af61790057')
provides=('libSDL2.so')

build() {
	cd SDL2-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd SDL2-${pkgver}
	make install DESTDIR=${pkgdir}
	install -Dm 644 LICENSE.txt ${pkgdir}/usr/share/licenses/libsdl2/LICENSE
}
