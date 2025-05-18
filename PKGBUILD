# Maintainer: Yao Zi <ziyao@disroot.org>

pkgbase=numactl
pkgname=(numactl libnuma)
pkgver=2.0.19
pkgrel=1
pkgdesc='Utils and library for monitoring and controlling NUMA policies'
url='https://github.com/numactl/numactl'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.1-only)
depends=(musl)
makedepends=(linux-headers)
source=("$pkgname-$pkgver.tar.gz::https://github.com/numactl/numactl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8b84ffdebfa0d730fb2fc71bb7ec96bb2d38bf76fb67246fde416a68e04125e4')

prepare() {
	cd "$pkgname-$pkgver"

	autoreconf -fiv
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr
	make
	make install DESTDIR="$srcdir/fakeinstall"

	cd "$srcdir/fakeinstall"

	msg2 "Picking libnuma files"

	_pick_ libnuma usr/include
	_pick_ libnuma usr/lib/
	_pick_ libnuma usr/share/man/man{2,3}

	msg2 "Picking numactl files"
	_pick_ numactl usr/bin
	_pick_ numactl usr/share/man/man8

	find "$srcdir/fakeinstall" -depth -exec rmdir {} +
}

# Testsuite must be run on systems with NUMA support enabled.
# check() {
#	cd "$pkgname-$pkgver"
#
#	make check
# }

package_libnuma() {
	pkgdesc='Library for monitoring and controlling NUMA policies'
	license=(LGPL-2.1-only)
	provides=(libnuma.so)

	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
}

package_numactl() {
	pkgdesc='Utils for monitoring and controlling NUMA policies'
	license=(GPL-2.0-only)
	depends+=(libnuma)

	mv "$srcdir/pkgs/$pkgname/"* "$pkgdir"
}
