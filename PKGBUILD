# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=dconf-editor
pkgver=45.0.1
pkgrel=1
pkgdesc="GSettings editor for GNOME"
url="https://wiki.gnome.org/Apps/DconfEditor"
arch=(x86_64 aarch64 riscv64)
license=(GPL3)
depends=(
  dconf
  gtk3
  libhandy
)
makedepends=(
  git
  meson
  vala
)
groups=(gnome-extra)
source=("git+https://gitlab.gnome.org/GNOME/dconf-editor.git#tag=$pkgver")
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
