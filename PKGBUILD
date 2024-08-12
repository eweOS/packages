# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=inotify-tools
pkgver=4.23.9.0
pkgrel=1
pkgdesc='A C library and a set of command-line programs providing a simple interface to inotify'
url='https://github.com/inotify-tools/inotify-tools'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-only)
depends=(musl)
provides=(libinotifytools.so)
source=("https://github.com/inotify-tools/inotify-tools/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1dfa33f80b6797ce2f6c01f454fd486d30be4dca1b0c5c2ea9ba3c30a5c39855')

build () {
	cd "$pkgname-$pkgver"

	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"

	make check
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
