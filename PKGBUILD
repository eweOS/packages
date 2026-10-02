# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-dbus-proxy
pkgver=0.1.9
pkgrel=1
pkgdesc="Filtering proxy for D-Bus connections"
url="https://github.com/flatpak/xdg-dbus-proxy"
arch=(x86_64 aarch64 riscv64 loongarch64)
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
sha256sums=('0cb047f9ac95e994fce6a5b6134c99e09ef8e6d178afef566db293b4dd6a8ade')

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
