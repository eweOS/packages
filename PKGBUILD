# Maintainer: Yao Zi <me@ziyao.cc>
# TODO: Add a service description for rdnssd

pkgname=ndisc6
pkgver=1.0.9
pkgrel=1
pkgdesc='IPv6 diagnostic tools'
url='https://www.remlab.net/ndisc6/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(musl)
makedepends=(linux-uapi-headers)
source=("https://www.remlab.net/files/ndisc6/archive/ndisc6-$pkgver.tar.bz2")
sha256sums=('1fdcd2f2abc8a69f182631a53902d0720fc8b00703e2d9131dadab7e327f478b')

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr \
		--sbindir=/usr/bin	\
		--sysconfdir=/etc	\
		--localstate=/var	\
		--disable-suid-install
	make
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir"

	# Should be created with tmpfiles
	rmdir "$pkgdir"{/var/run/rdnssd,/var/run,/var}
}
