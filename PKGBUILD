# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=lame
pkgver=3.100
pkgrel=1
pkgdesc='a high quality MP3 encoder licensed under the LGPL.'
url='https://lame.sourceforge.io/'
arch=(x86_64 aarch64 riscv64)
license=(LGPL3)
depends=(musl)
makedepends=(nasm)
source=("https://sourceforge.net/projects/lame/files/lame/$pkgver/lame-$pkgver.tar.gz")
provides=('libmp3lame.so')

build () {
	cd lame-$pkgver
	./configure --prefix=/usr --enable-nasm --enable-mp3rtp
	make
}

check() {
	cd lame-$pkgver
	make check
}

package() {
	cd lame-$pkgver
	make install DESTDIR=${pkgdir}
}

sha256sums=('SKIP')
