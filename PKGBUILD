# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-session-lock
pkgver=0.2.0
pkgrel=1
provides=(libgtk-session-lock.so=0-64)
pkgdesc="A library to create screen lockers for Wayland using the ext-session-lock protocol"
arch=(x86_64 aarch64 riscv64)
license=(GPL3)
url="https://github.com/Cu3PO42/gtk-session-lock"
depends=(
  gtk3
  wayland
)
makedepends=(
  meson
  gobject-introspection
  wayland-protocols
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Cu3PO42/gtk-session-lock/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a4245c6930580c15ed263b9a7bb7e39f47693baec78be1026b4e0e28b233cb4e')

build() {
  cd "$pkgname-$pkgver"
  ewe-meson build -D vapi=false
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}
