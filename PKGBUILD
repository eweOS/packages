# Maintainer: Yukari Chiba <i@0x7f.cc>

pkgname=hicolor-icon-theme
pkgver=0.18
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme"
arch=('any')
url="https://www.freedesktop.org/wiki/Software/icon-theme/"
license=('GPL2')
makedepends=(meson)
source=("https://icon-theme.freedesktop.org/releases/${pkgname}-${pkgver}.tar.xz")
sha256sums=('db0e50a80aa3bf64bb45cbca5cf9f75efd9348cf2ac690b907435238c3cf81d7')

build() {
  ewe-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

