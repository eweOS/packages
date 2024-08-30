# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=xdg-dbus-proxy
pkgver=0.1.6
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
sha256sums=('bf8faec9cedf50025079711557677e5eaa016cf599d090d76eab74a7d096ce4f')

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
