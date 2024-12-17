# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iperf3
pkgver=3.18
pkgrel=1
pkgdesc='The ultimate speed test tool for TCP, UDP and SCTP'
url='https://iperf.fr/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD-3-Clause)
depends=(musl openssl)
source=("https://github.com/esnet/iperf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ef9ffabf16926701a11c9b7e95dccdf64ff304b7b20dcb6f28aed06b240b7e99')
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
