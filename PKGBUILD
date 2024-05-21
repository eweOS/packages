# Maintainer: Fabian Bornschein <i@0x7f.cc>

pkgname=d-spy
pkgver=1.10.0
pkgrel=1
pkgdesc="D-Bus debugger for GNOME"
url="https://gitlab.gnome.org/GNOME/d-spy"
arch=(x86_64 aarch64 riscv64)
license=(
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
depends=(
  dconf
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
)
makedepends=(
  git
  meson
)
provides=(libdspy-1.so)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/d-spy.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson d-spy build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
