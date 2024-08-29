# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=yelp-tools
pkgver=42.1
pkgrel=1
pkgdesc="Collection of tools for building and converting documentation"
url="https://gitlab.gnome.org/GNOME/yelp-tools"
arch=(any)
depends=(yelp-xsl python-lxml itstool libxml2 docbook-xsl mallard-ducktype)
makedepends=(git meson)
license=(GPL)
source=("git+https://gitlab.gnome.org/GNOME/yelp-tools.git#tag=$pkgver")
sha256sums=('f332ceaa2556175f3cff6b8cf2f3051b1024d36beab9fe5d8ca909e2795929f3')

build() {
  ewe-meson $pkgname build -D help=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
