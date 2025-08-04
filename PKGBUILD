# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iperf3
pkgver=3.19.1
pkgrel=1
pkgdesc='The ultimate speed test tool for TCP, UDP and SCTP'
url='https://iperf.fr/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl openssl)
source=("https://github.com/esnet/iperf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('85e480d7fffdcb1368888aaee9d76bcfc211e17c2a6dcb2060b281498f82c97b')
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
