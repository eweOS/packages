# Maintainer: Julian <juliandroske@outlook.com>

pkgname=ethtool
pkgver=6.11
pkgrel=1
pkgdesc="Utility for controlling network drivers and hardware"
url="https://cdn.kernel.org/pub/software/network/ethtool"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(GPL-2.0-only)
depends=(
  musl
  libmnl
)
makedepends=(
  linux-headers
)
source=(
  "https://cdn.kernel.org/pub/software/network/$pkgname/$pkgname-$pkgver.tar.gz"
)
sha256sums=('a8bee475d991939cad182b7dbcf3a1f139aeed8cb0add73d72084cd71d43282b')

prepare() {
  _patch_ "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
