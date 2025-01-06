# Maintainer: Yao Zi <ziyao@disroot.org>

pkgname=xxhash
pkgver=0.8.3
pkgrel=1
pkgdesc='An extremely fast hash algorithm'
url='https://github.com/Cyan4973/xxHash'
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(BSD)
depends=(musl)
source=("https://github.com/Cyan4973/xxHash/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80')

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
