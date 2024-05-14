# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xxhash
pkgver=0.8.2
pkgrel=2
pkgdesc='An extremely fast hash algorithm'
url='https://github.com/Cyan4973/xxHash'
arch=(x86_64 aarch64 riscv64)
license=(BSD)
depends=(musl)
source=("https://github.com/Cyan4973/xxHash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('baee0c6afd4f03165de7a4e67988d16f0f2b257b51d0e3cb91909302a26a79c4')

build () {
  cd xxHash-$pkgver
  make PREFIX=/usr DISPATCH=1
}

check() {
  cd xxHash-$pkgver
  make PREFIX=/usr DISPATCH=1 check
}

package() {
  cd xxHash-$pkgver
  make PREFIX=/usr DISPATCH=1 install DESTDIR=$pkgdir
}
