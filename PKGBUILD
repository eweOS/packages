# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yelp-xsl
pkgver=42.4
pkgrel=1
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL-2.0-or-later LGPL-2.1-or-later MIT)
makedepends=(libxml2 libxslt itstool meson ninja git)
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#tag=$pkgver")
sha256sums=('2df20fce55630fe403946f67c67c4b712ffd810fde0d7ca39c2c7e21297b6d15')

build() {
  ewe-meson build yelp-xsl
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd yelp-xsl
  _install_license_ COPYING.MIT MIT
  _install_license_ COPYING.GPL GPL
  _install_license_ COPYING.LGPL LGPL
  _install_license_ COPYING README
}
