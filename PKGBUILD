# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tcpdump
pkgver=4.99.6
pkgrel=2
pkgdesc='A powerful command-line packet analyzer'
url='https://www.tcpdump.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libpcap)
source=("https://www.tcpdump.org/release/tcpdump-$pkgver.tar.xz")
sha256sums=('40a8cefd45f0d2a06827e6658efb830d484868c449ad80f7efb33516af44f3da')

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
