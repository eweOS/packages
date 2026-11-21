# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wdisplays
pkgver=1.3.0
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
sha512sums=('98ca86003dc998bb45c835e66007b74bc70ddd434089b0ef0a8ff2030a0952781872b22c29cfd272b71092dc26796a1627c1ebf78768e9d6fa21dd98d138ff1d')

build() {
  cd "$pkgname-$pkgver"
  ewe-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
