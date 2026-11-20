# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-doc
pkgver=1.37.0
pkgrel=1
pkgdesc="Documentation tool for public library API"
url="https://www.gtk.org/gtk-doc/"
arch=(any)
license=(
  GFDL-1.1-or-later
  GPL-2.0-or-later
)
depends=(
  docbook-xml
  docbook-xsl
  glib2
  glib2-docs
  python-lxml
  python-pygments
)
makedepends=(
  yelp-tools
  git
  meson
)
checkdepends=(
  gtk3
  python-parameterized
)
optdepends=('dblatex: PDF support')
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk-doc.git#tag=$pkgver"
)
sha256sums=('9d2664a07e755249d956533182fc9285a3ffa75e195f8eea89fbd20f30ff5be5')

build() {
  ewe-meson gtk-doc build
  meson compile -C build
}

check() {
  CC=cc meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
