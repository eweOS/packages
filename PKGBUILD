# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xxhash
pkgver=0.8.4
pkgrel=1
pkgdesc='An extremely fast hash algorithm'
url='https://github.com/Cyan4973/xxHash'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(musl)
source=("https://github.com/Cyan4973/xxHash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32')

build () {
  cd xxHash-$pkgver
  if [ "$CARCH" == "x86_64" ]; then
    make PREFIX=/usr DISPATCH=1
  else
    make PREFIX=/usr
  fi
}

check() {
  cd xxHash-$pkgver
  if [ "$CARCH" == "x86_64" ]; then
    make PREFIX=/usr DISPATCH=1 check
  else
    make PREFIX=/usr check
  fi
}

package() {
  cd xxHash-$pkgver
  if [ "$CARCH" == "x86_64" ]; then
    make PREFIX=/usr DISPATCH=1 install DESTDIR=$pkgdir
  else
    make PREFIX=/usr install DESTDIR=$pkgdir
  fi
}
