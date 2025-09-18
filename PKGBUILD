# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=inotify-tools
pkgver=4.25.9.0
pkgrel=1
pkgdesc='A C library and a set of command-line programs providing a simple interface to inotify'
url='https://github.com/inotify-tools/inotify-tools'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(musl)
provides=(libinotifytools.so)
source=("https://github.com/inotify-tools/inotify-tools/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d33a4fd24c72c2d08893f129d724adf725b93dae96c359e4f4e9f32573cc853b')

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
