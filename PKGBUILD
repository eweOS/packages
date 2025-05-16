# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zenity
pkgver=4.0.5
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
sha256sums=('ff25d51c9670bf4e152cde7fb321cf79726fc91af10c71d08d73cb9356c6db34')

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
