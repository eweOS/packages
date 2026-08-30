# Maintainer: Yao Zi <me@ziyao.cc>

pkgname=smartmontools
pkgver=7.5
pkgrel=3
pkgdesc='Programs to control and monitor storage systems using S.M.A.R.T.'
url='https://www.smartmontools.org/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(gnupg linux-headers)
source=("https://sourceforge.net/projects/smartmontools/files/smartmontools/$pkgver/smartmontools-$pkgver.tar.gz")
sha256sums=('690b83ca331378da9ea0d9d61008c4b22dde391387b9bbad7f29387f2595f76e')

prepare() {
	cd "smartmontools-$pkgver"
	autoreconf -fiv
}

build () {
	cd "smartmontools-$pkgver"
	./configure --prefix=/usr		\
		--sbindir=/usr/bin		\
		--sysconfdir=/etc		\
		--with-gnupg			\
		--without-selinux		\
		--without-libcap-ng		\
		--without-libsystemd		\
		--with-nvme-devicescan
	make
}

check() {
	cd "smartmontools-$pkgver"
	make check
}

package() {
	cd "smartmontools-$pkgver"
	make install DESTDIR=$pkgdir
}
