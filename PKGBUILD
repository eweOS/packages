# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libserialport
pkgver=0.1.1
_path=$pkgname-$pkgname-$pkgver
pkgrel=1
pkgdesc='A minimal, cross-platform serial port library.'
url='https://sigrok.org/wiki/Libserialport'
arch=(x86_64 aarch64 riscv64)
license=(LGPL-3.0-or-later)
depends=(musl)
provides=(libserialport.so)
source=("https://github.com/sigrokproject/libserialport/archive/refs/tags/libserialport-$pkgver.tar.gz")
sha256sums=('4e3573e3bdbb6b0a872f32c4826d1b6b630dcc3eeb5f05d0501bb79d738a09ea')

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
