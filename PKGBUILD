# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=libhandy
pkgver=1.8.3
pkgrel=1
pkgdesc="Library full of GTK+ widgets for mobile phones"
url="https://gitlab.gnome.org/GNOME/libhandy"
arch=(x86_64 aarch64 riscv64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  gtk3
)
makedepends=(
  git
  glade
  gobject-introspection
  meson
  vala
)
source=("git+https://gitlab.gnome.org/GNOME/libhandy.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  ewe-meson libhandy build
  meson compile -C build
}

package() {
  provides=(libhandy-1.so)

  meson install -C build --destdir "$pkgdir"
}
