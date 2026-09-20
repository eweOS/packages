# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=liburcu
pkgver=0.15.7
pkgrel=1
pkgdesc='Userspace data synchronization library based on Read-Copy Update'
url='https://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
provides=(liburcu-bp.so liburcu-cds.so liburcu-common.so liburcu-mb.so
	  liburcu-memb.so liburcu-qsbr.so liburcu.so)
source=("https://lttng.org/files/urcu/userspace-rcu-$pkgver.tar.bz2")
sha256sums=('2556b83adc0f9b3ac8024e613e17d014d04c4c49110604ce55fcb14eae32edd3')
_srcdir="userspace-rcu-$pkgver"

build() {
	cd "$_srcdir"

	./configure --prefix=/usr
	make
}

check() {
	cd "$_srcdir"

	make check
}

package() {
	cd "$_srcdir"

	make install DESTDIR="$pkgdir"
}
