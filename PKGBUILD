# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=zimg
pkgver=3.0.5
pkgrel=1
pkgdesc='Scaling, colorspace conversion, and dithering library '
url='https://github.com/sekrit-twc/zimg'
arch=(x86_64 aarch64 riscv64)
license=(WTFPL)
depends=(musl)
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

sha256sums=('a9a0226bf85e0d83c41a8ebe4e3e690e1348682f6a2a7838f1b8cbff1b799bcf')
