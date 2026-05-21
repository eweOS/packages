# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-dbus-proxy
pkgver=0.1.7
pkgrel=2
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
sha256sums=('900891e24b0dbdbbea6555d49484e77837dda4ec4b789054f871b901fa359fc3')

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
