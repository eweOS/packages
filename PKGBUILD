# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xxhash
pkgver=0.8.2
pkgrel=1
pkgdesc='An extremely fast hash algorithm'
url='https://github.com/Cyan4973/xxHash'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
source=("https://github.com/Cyan4973/xxHash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4')

build () {
	cd xxHash-$pkgver
	make
}

check() {
	cd xxHash-$pkgver
	make check
}

package() {
	cd xxHash-$pkgver
	make install DESTDIR=$pkgdir
}
