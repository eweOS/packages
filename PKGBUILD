# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libsrt
pkgver=1.5.3
pkgrel=1
pkgdesc='Secure Reliable Transport (SRT)'
url='https://www.srtalliance.org/'
arch=(x86_64 aarch64 riscv64)
license=(MPL2)
depends=(openssl)
makedepends=(cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Haivision/srt/archive/refs/tags/v$pkgver.tar.gz")

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

sha256sums=('befaeb16f628c46387b898df02bc6fba84868e86a6f6d8294755375b9932d777')
