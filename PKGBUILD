# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=sbc
pkgver=2.2
pkgrel=1
pkgdesc='Bluetooth low-complexity, subband codec (SBC) library'
url='https://git.kernel.org/pub/scm/bluetooth/sbc.git'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only LGPL-2.0-only)
depends=(musl libsndfile)
makedepends=(git linux-uapi-headers)
provides=(libsbc.so)
source=("git+https://git.kernel.org/pub/scm/bluetooth/sbc.git#tag=$pkgver")
sha256sums=('8f6c1bb1a0153c89323fe144e23b81dfe451619bd29af2c05c2e0fe066ef5637')

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
