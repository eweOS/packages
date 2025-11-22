# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iperf3
pkgver=3.20
pkgrel=1
pkgdesc='The ultimate speed test tool for TCP, UDP and SCTP'
url='https://iperf.fr/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl openssl)
source=("https://github.com/esnet/iperf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('84640ea0f43831850434e50134d0554b7a94f97fb02e2488ffbe252c9fb05a56')
provides=(libiperf.so)

build () {
	cd iperf-$pkgver
	./configure --prefix=/usr
	make
}

check() {
	cd iperf-$pkgver
	make check
}

package() {
	cd iperf-$pkgver
	make install DESTDIR=${pkgdir}
	_install_license_ LICENSE
}
