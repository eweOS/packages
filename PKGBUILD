# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=iperf3
pkgver=3.16
pkgrel=1
pkgdesc='The ultimate speed test tool for TCP, UDP and SCTP'
url='https://iperf.fr/'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
source=("https://github.com/esnet/iperf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be859e7168d0c867029e7013a8de273a169b4842ec7c24cd6570af75d5080aa3')
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
