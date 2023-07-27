# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrt
pkgver=1.5.2
pkgrel=0
pkgdesc='Secure Reliable Transport (SRT)'
url='https://www.srtalliance.org/'
arch=(x86_64)
license=(MPL2)
depends=(openssl)
makedepends=(cmake)
source=("https://github.com/Haivision/srt/archive/refs/tags/v$pkgver.tar.gz")

build () {
	cd srt-$pkgver
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make 
}

package() {
	cd srt-$pkgver
	make install DESTDIR=$pkgdir
	mv $pkgdir/usr/lib64 $pkgdir/usr/lib
	install -Dm 644 LICENSE $pkgdir/usr/share/licenses/libsrt/LICENSE
}

sha256sums=('463970a3f575446b3f55abb6f323d5476c963c77b3c975cd902e9c87cdd9a92c')
