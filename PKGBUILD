# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=zenity
pkgver=4.2.2
pkgrel=2
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
sha256sums=('44dd4f311e9723ee07ede78a91b77d68ba4baf285eee3cfcebda122d2912eb8a')

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
