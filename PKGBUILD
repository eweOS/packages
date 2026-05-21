# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tinc
pkgver=1.0.37
pkgrel=2
pkgdesc='A Virtual Private Network (VPN) daemon'
url='https://tinc-vpn.org/download/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl lzo openssl zlib-ng)
makedepends=(linux-headers autoconf)
source=("https://tinc-vpn.org/packages/tinc-$pkgver.tar.gz")
sha256sums=('f63b7e21c32c4c637576d85f36bdd28ea678b5aa17fad02427645dea30e52ac7')

prepare () {
	cd "$pkgname-$pkgver"
	autoreconf -fiv
}

build () {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--sbindir=/usr/bin	\
		--sysconfdir=/etc	\
		--localstatedir=/var	\
		--runstatedir=/var/run
	make
}

# No checks

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"
}
