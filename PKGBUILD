# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sbc
pkgver=2.1
pkgrel=1
pkgdesc='Bluetooth low-complexity, subband codec (SBC) library'
url='https://git.kernel.org/pub/scm/bluetooth/sbc.git'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.0-only)
depends=(musl libsndfile)
makedepends=(git linux-uapi-headers)
provides=(libsbc.so)
source=("git+https://git.kernel.org/pub/scm/bluetooth/sbc.git#tag=$pkgver")
sha256sums=('e459210fa3b28b68cb904b95420a96eb8a7e3a1ed0812c89e473d4ef00af5c0a')

prepare() {
	cd "$pkgname"
	autoreconf -fiv
}

build() {
	cd "$pkgname"

	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"

	make check
}

package() {
	cd "$pkgname"

	make install DESTDIR="$pkgdir"
}
