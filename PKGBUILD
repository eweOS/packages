# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=smartmontools
pkgver=7.4
pkgrel=1
pkgdesc='Programs to control and monitor storage systems using S.M.A.R.T.'
url='https://www.smartmontools.org/'
arch=(x86_64 aarch64 riscv64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(gnupg linux-headers)
source=("https://sourceforge.net/projects/smartmontools/files/smartmontools/$pkgver/smartmontools-$pkgver.tar.gz")
sha256sums=('e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d')

build () {
	cd smartmontools-$pkgver
	./configure --prefix=/usr		\
		--sbindir=/usr/bin		\
		--with-gnupg			\
		--without-selinux		\
		--without-libcap-ng		\
		--without-libsystemd		\
		--with-nvme-devicescan
	make
}

check() {
	cd smartmontools-$pkgver
	make check
}

package() {
	cd smartmontools-$pkgver
	make install DESTDIR=$pkgdir
}
