# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libserialport
pkgver=0.1.2
_path=$pkgname-$pkgname-$pkgver
pkgrel=1
pkgdesc='A minimal, cross-platform serial port library.'
url='https://sigrok.org/wiki/Libserialport'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-3.0-or-later)
depends=(musl)
provides=(libserialport.so)
source=("https://github.com/sigrokproject/libserialport/archive/refs/tags/libserialport-$pkgver.tar.gz")
sha256sums=('cbb1192a09ff31d34e7efdb17a2f50d9d1974461c0b81c29bb449515d78d8950')

build () {
	cd $_path
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd $_path
	make install DESTDIR=$pkgdir
}
