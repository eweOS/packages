# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tcpdump
pkgver=4.99.5
pkgrel=1
pkgdesc='A powerful command-line packet analyzer'
url='https://www.tcpdump.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl libpcap)
source=("https://www.tcpdump.org/release/tcpdump-$pkgver.tar.xz")
sha256sums=('d76395ab82d659d526291b013eee200201380930793531515abfc6e77b4f2ee5')

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
