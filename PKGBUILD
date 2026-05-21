# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yelp-xsl
pkgver=49.0
pkgrel=2
pkgdesc="Document transformations from Yelp"
url="https://gitlab.gnome.org/GNOME/yelp-xsl"
arch=(any)
license=(GPL-2.0-or-later LGPL-2.1-or-later MIT)
makedepends=(libxml2 libxslt itstool meson ninja git)
source=("git+https://gitlab.gnome.org/GNOME/yelp-xsl.git#tag=$pkgver")
sha256sums=('15040d32c7fa4f97b00ca6b5879f5850dd4dd0a09b416c4cdf6dcf38240f33fb')

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
