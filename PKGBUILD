# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=wdisplays
pkgver=1.1.1
pkgrel=1
pkgdesc="GUI display configurator for wlroots compositors"
url="https://github.com/artizirk/wdisplays"
license=(GPL3)
arch=(x86_64 aarch64 riscv64)
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
sha512sums=('46923592e9fbb5c06c3549c198aedbafd8e0b5a6a82bc11d9d0b4cb0860070000cce18e0aa109932a4e4bee34d9f235660d2ea9d485a8fce146a2755ef62f81d')

build() {
  cd "$pkgname-$pkgver"
  ewe-meson "$srcdir/build"
  ninja -C "$srcdir/build"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
}
