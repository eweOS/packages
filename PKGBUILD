# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-doc
pkgver=1.36.0
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
optdepends=('dblatex: PDF support')
source=(
  "git+https://gitlab.gnome.org/GNOME/gtk-doc.git#tag=$pkgver"
)
sha256sums=('b264cb0e4e81dae26be58997d3613af0c7d131f99467049d56cfabd2bd7d2377')

build() {
  ewe-meson gtk-doc build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
