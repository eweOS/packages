# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wdisplays
pkgver=1.1.3
pkgrel=1
pkgdesc="GUI display configurator for wlroots compositors"
url="https://github.com/artizirk/wdisplays"
license=(GPL3)
arch=(x86_64 aarch64 riscv64 loongarch64)
depends=(
  gtk3
  libepoxy
  wayland
  wayland-protocols
)
makedepends=(meson)
source=(
  $pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz
)
sha512sums=('7260deddb5871359ae9b0133cc9fa2f0b43e43664ff84cd37ad10385c4c2618a3b3303536be060097b982c7d2ab3890392ba9775e01b44281c1b3419256398a8')

build() {
  cd "$pkgname-$pkgver"
  ewe-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
