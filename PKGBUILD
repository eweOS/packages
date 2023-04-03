# Maintainer: Ziyao <ziyao@disroot.org>

pkgname=libsamplerate
pkgver=0.2.2
pkgrel=0
pkgdesc="A Sample Rate Converter for audio."
url="https://libsndfile.github.io/libsamplerate/"
arch=(x86_64 aarch64)
license=('BSD')
depends=('musl' 'libsndfile')
source=("https://github.com/libsndfile/libsamplerate/releases/download/${pkgver}/libsamplerate-${pkgver}.tar.xz")
sha256sums=('3258da280511d24b49d6b08615bbe824d0cacc9842b0e4caf11c52cf2b043893')
provides=('libsamplerate.so')

build() {
	cd libsamplerate-${pkgver}
	./configure --prefix=/usr
	make
}

check() {
	cd libsamplerate-${pkgver}
	make check
}

package() {
	cd libsamplerate-${pkgver}
	make install DESTDIR=${pkgdir}
	install -Dm 644 COPYING ${pkgdir}/usr/share/licenses/libsamplerate/LICENSE
}
