# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsdl2
pkgver=2.26.5
pkgrel=1
pkgdesc="Simple DirectMedia Layer"
url="https://libsdl.org"
arch=(x86_64 aarch64)
license=('zlib')
depends=('musl' 'wayland' 'libudev' 'dbus' 'libsamplerate')
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL2-${pkgver}.tar.gz")
sha256sums=('ad8fea3da1be64c83c45b1d363a6b4ba8fd60f5bde3b23ec73855709ec5eabf7')
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
