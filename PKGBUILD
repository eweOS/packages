# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=tinc
pkgver=1.0.36
pkgrel=3
pkgdesc='A Virtual Private Network (VPN) daemon'
url='https://tinc-vpn.org/download/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl lzo openssl zlib-ng)
makedepends=(linux-headers autoconf)
source=("https://tinc-vpn.org/packages/tinc-$pkgver.tar.gz")
sha256sums=('40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108')

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
