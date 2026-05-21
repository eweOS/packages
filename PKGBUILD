# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=liburcu
pkgver=0.15.6
pkgrel=2
pkgdesc='Userspace data synchronization library based on Read-Copy Update'
url='https://lttng.org/files/urcu/userspace-rcu-0.15.3.tar.bz2'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(musl)
provides=(liburcu-bp.so liburcu-cds.so liburcu-common.so liburcu-mb.so
	  liburcu-memb.so liburcu-qsbr.so liburcu.so)
source=("https://lttng.org/files/urcu/userspace-rcu-$pkgver.tar.bz2")
sha256sums=('850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f')
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
