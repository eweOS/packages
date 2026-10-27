# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tcpdump
pkgver=4.99.7
pkgrel=1
pkgdesc='A powerful command-line packet analyzer'
url='https://www.tcpdump.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libpcap)
source=("https://www.tcpdump.org/release/tcpdump-$pkgver.tar.xz")
sha256sums=('39675dfa06fb0e99be8da5d4a1784acbaab58ae0870231d956ff7870cb99eec1')

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
	_install_license_ LICENSE
}
