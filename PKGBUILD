# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=zimg
pkgver=3.0.6
pkgrel=1
pkgdesc='Scaling, colorspace conversion, and dithering library '
url='https://github.com/sekrit-twc/zimg'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(WTFPL)
depends=(musl linux-headers)
source=("https://github.com/sekrit-twc/zimg/archive/refs/tags/release-$pkgver.tar.gz")
provides=('libzimg.so')

build () {
	cd zimg-release-$pkgver
	./autogen.sh
	./configure \
		--prefix=/usr
	make
}

check() {
	cd zimg-release-$pkgver
	make check
}

package() {
	cd zimg-release-$pkgver
	make install DESTDIR=$pkgdir
	install -Dm 644 COPYING $pkgdir/usr/share/licenses/zimg/COPYING
}

sha256sums=('be89390f13a5c9b2388ce0f44a5e89364a20c1c57ce46d382b1fcc3967057577')
