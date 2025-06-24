# Maintainer: Julian <juliandroske@outlook.com>

pkgname=ethtool
pkgver=6.15
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
sha256sums=('5d21a75b54c5e617b8ac0fe161e2ef3a75ecdf569ab64831474882dd3ece6077')

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
