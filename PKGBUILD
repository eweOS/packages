# Maintainer: aisuneko <iceneko@protonmail.ch>

pkgname=radeontop
pkgver=1.4
pkgrel=1
pkgdesc='View GPU utilization for AMD GPUs'
url='https://github.com/clbr/radeontop'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-3.0-only)
depends=(musl libdrm libpciaccess ncurses)
makedepends=(linux-headers)
source=("https://github.com/clbr/radeontop/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2c1e2aace1a749d8e4530047ce245004e0f7d1d32a99037917e03d83e60f7ad1')

build() {
	cd "$pkgname-$pkgver"
	make xcb=0
}

package() {
	cd "$pkgname-$pkgver"
	make xcb=0 install DESTDIR="$pkgdir"
}
