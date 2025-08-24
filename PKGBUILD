# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=liburcu
pkgver=0.15.3
pkgrel=1
pkgdesc='Userspace data synchronization library based on Read-Copy Update'
url='https://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
provides=(liburcu-bp.so liburcu-cds.so liburcu-common.so liburcu-mb.so
	  liburcu-memb.so liburcu-qsbr.so liburcu.so)
source=("https://lttng.org/files/urcu/userspace-rcu-$pkgver.tar.bz2")
sha256sums=('26687ec84e3e114759454c884a08abeaf79dec09b041895ddf4c45ec150acb6d')
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
