# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-dbus-proxy
pkgver=0.1.5
pkgrel=1
pkgdesc="Filtering proxy for D-Bus connections"
url="https://github.com/flatpak/xdg-dbus-proxy"
arch=(x86_64 aarch64 riscv64)
license=(LGPL)
depends=(
  dbus
  glib
)
makedepends=(
  docbook-xsl
  git
  meson
)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
