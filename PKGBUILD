# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=i2c-tools
pkgver=4.4
pkgrel=1
pkgdesc='A set of I2C tools for Linux'
url='https://www.kernel.org/pub/software/utils/i2c-tools/'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-or-later)
depends=(musl)
makedepends=(linux-headers)
provides=(libi2c.so)
source=("https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools/i2c-tools-$pkgver.tar.gz")
sha256sums=('04d1e3b0cd88df8fb96e7709f374dd0b3561191b4c0363eaf873a074b8b7cb22')

_makeargs=(
	BUILD_DYNAMIC_LIB=1
	BUILD_STATIC_LIB=0
	PREFIX=/usr
	sbindir=/usr/bin
)

build() {
	cd "$pkgname-$pkgver"
	make ${_makeargs[*]}
}

package() {
	cd "$pkgname-$pkgver"

	make install DESTDIR="$pkgdir" \
		 ${_makeargs[*]}
}
