# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zenity
pkgver=4.2.0
pkgrel=1
pkgdesc="Display graphical dialog boxes from shell scripts"
url="https://gitlab.gnome.org/GNOME/zenity"
arch=(x86_64 aarch64 riscv64 loongarch64)
license=(LGPL-2.1-or-later)
depends=(
  glib2
  gtk4
  hicolor-icon-theme
  libadwaita
  pango
)
makedepends=(
  git
  glib2
  help2man
  meson
  util-linux
  yelp-tools
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('af4e6140f17b67dcafe1940e2e7d963ca586e2b69f88085bdf0a6bc1f792f022')

build() {
  ewe-meson zenity build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  hardlink -c "$pkgdir/usr/share/help"
}
