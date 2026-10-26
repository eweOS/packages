# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=libnetfilter_conntrack
pkgver=1.1.1
pkgrel=1
pkgdesc='Userspace library providing API to in-kernel connection tracking state table'
url='https://www.netfilter.org/projects/libnetfilter_conntrack/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl libmnl libnfnetlink)
makedepends=(linux-uapi-headers)
provides=(libnetfilter_conntrack.so)
source=("https://www.netfilter.org/pub/libnetfilter_conntrack/libnetfilter_conntrack-$pkgver.tar.xz")
sha256sums=('769d3eaf57fa4fbdb05dd12873b6cb9a5be7844d8937e222b647381d44284820')

build() {
	cd "$pkgname-$pkgver"

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
