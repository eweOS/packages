# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iperf3
pkgver=3.17.1
pkgrel=1
pkgdesc='The ultimate speed test tool for TCP, UDP and SCTP'
url='https://iperf.fr/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
source=("https://github.com/esnet/iperf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('105b4fe7fbce31c9b94a3fec10c46e3b4b298adc076e1e3af52b990e1faf2db9')
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
