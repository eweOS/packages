# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=anthy
pkgver=9100h
_filecode=37536
pkgrel=1
pkgdesc='Anthy is a system for Japanese input method.'
url='https://osdn.net/projects/anthy/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later LGPL-2.1-or-later)
depends=(musl)
provides=(libanthy.so libanthyinput.so libanthydic.so)
source=("https://osdn.ip-connect.vn.ua/anthy/$_filecode/anthy-$pkgver.tar.gz")
sha256sums=('d256f075f018b4a3cb0d165ed6151fda4ba7db1621727e0eb54569b6e2275547')

build () {
	cd anthy-$pkgver
	autoreconf -ivf
	./configure --prefix=/usr \
		--sysconfdir=/etc
	make
}

check() {
	cd anthy-$pkgver
	make check
}

package() {
	cd anthy-$pkgver
	make install DESTDIR=$pkgdir
}
