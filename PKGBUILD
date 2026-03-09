# Maintainer: Julian <juliandroske@outlook.com>

pkgname=ethtool
pkgver=6.19
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
sha256sums=('1c1a2f9fc02670ab005fb3e5de16688852bd6cea7e15ebc6ec91d0278b00dd79')

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
