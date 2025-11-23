# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=libspnav
pkgver=1.2
pkgrel=1
pkgdesc='Library to get input from 6-dof devices'
url='https://spacenav.sourceforge.net/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl)
provides=(libspnav.so)
source=("https://github.com/FreeSpacenav/libspnav/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e675a2476bd407b8d97a33f93c6651ad3ecdfd422916f260bd620f2aec7ca45f')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--disable-x11
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
	_install_license_ LICENSE
}
