# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=gtk-doc
pkgver=1.35.1
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
sha256sums=('a5fca806f9280cc0b221882aef650ec5862f9c9b7447660e133f0fede7c1dc1b')

build() {
  ewe-meson gtk-doc build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
